import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Bloc/mobiz_bloc/mobiz_bloc.dart';
import 'package:project/Repositiry/Model_Class/mobiz_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Sales.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> _currentIndex = [];
  late Mobiz response;
  String productid = '';

  @override
  void initState() {
    BlocProvider.of<MobizBloc>(context).add(FetchMobiz());
    super.initState();
  }

  Future<void> _saveProductToPreferences(Map<String, dynamic> product) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productListJson = prefs.getStringList('productList') ?? [];
    List<Map<String, dynamic>> productList = productListJson.map((item) => jsonDecode(item) as Map<String, dynamic>).toList();

    // Check if the added product already exists in the productList
    bool productExists = false;
    for (int i = 0; i < productList.length; i++) {
      if (productList[i]['id'] == product['id']) {
        // Update the quantity of the existing product
        productList[i]['qty'] = (int.parse(productList[i]['qty']) + int.parse(product['qty'])).toString();
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      // Add the new product to the productList
      productList.add(product);
    }

    // Save the updated productList back to SharedPreferences
    List<String> updatedProductListJson = productList.map((item) => jsonEncode(item)).toList();
    await prefs.setStringList('productList', updatedProductListJson);
  }

  Future<void> _clearProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('productList');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff2a55ef),
        title: const Text('Selected Products', style: TextStyle(color: Colors.white)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<MobizBloc, MobizState>(
        builder: (context, state) {
          if (state is MobizblocLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MobizblocError) {
            return const Center(child: Text("ERROR"));
          }
          if (state is MobizblocLoaded) {
            response = BlocProvider.of<MobizBloc>(context).mobizModel;

            if (response.data == null || response.data!.isEmpty) {
              return const Center(child: Text('No Data'));
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: response.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => Sales(name: response.data![index].name ?? "name"),
                      ));

                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      String productid = response.data![index].id.toString();
                      await prefs.setString('productid', productid);

                      // Save the clicked product details to SharedPreferences
                      Map<String, dynamic> product = {
                        'id': response.data![index].id,
                        'name': response.data![index].name,
                        'price': response.data![index].price,
                        'qty': response.data![index].baseUnitQty.toString()
                      };
                      await _saveProductToPreferences(product);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xffc7c6c6),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Icon(Icons.camera_alt),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Text(
                                      response.data![index].name.toString(),
                                      style: const TextStyle(fontSize: 22),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    response.data![index].code.toString(),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ' BOX:${response.data![index].secondUnitQty.toString()}',
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      const Text(
                                        ' | ',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' PCS:${response.data![index].baseUnitQty.toString()}',
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const SizedBox(child: Center(child: Text('No Data')));
          }
        },
      ),
    );
  }
}
