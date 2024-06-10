import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Bloc/product_bloc/product_bloc.dart';
import 'package:project/Repositiry/Model_Class/Product_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';

class Sales extends StatefulWidget {
  final String name;

  const Sales({super.key, required this.name});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  late String price = '';
  late String unit = '';
  late String Qty = '';
  late String total = '';
  late String grandtotal;

  List<Map<String, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductBloc>(context).add(FetchProduct());
    _loadProductList();
  }

  Future<void> _loadProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> productListJson = prefs.getStringList('productList') ?? [];
    setState(() {
      productList = productListJson
          .map((item) => jsonDecode(item) as Map<String, dynamic>)
          .toList();
    });
  }

  Future<void> clearProductList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('productList');
    setState(() {
      productList.clear();
    });
  }

  void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sales Saved'),
          content: const Text('Inventory has been saved '),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (builder) => Home(),
                  ));
                },
                  child: const Text('OK')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff2a55ef),
        title: const Text('Sales',
            style: TextStyle(color: Colors.white, fontSize: 26)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                children: [
                  const Text('FD CENTER',
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff2a55ef),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          topLeft: Radius.circular(5)),
                      border: Border.all(width: 1),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: 60,
                        child: Center(
                          child: Text(
                            'VAT',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffffffff),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      border: Border.all(width: 1),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: 60,
                        child: Center(
                          child: Text(
                            'NO VAT',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 450,
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductblocLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is ProductblocError) {
                    return const Center(child: Text("ERROR"));
                  }
                  if (state is ProductblocLoaded) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final products =
                            BlocProvider.of<ProductBloc>(context).productModel;
                        price = products.data![0].price.toString();
                        Qty = products.data![0].qty.toString();
                        unit = products.data![0].units![0].name.toString();
                        total = products.data![0].price.toString() +
                            products.data![0].qty.toString();

                        var product = productList[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xffc7c6c6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(15.0),
                                          child: Icon(Icons.camera_alt),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Samsung Galaxy S24 Ultra 5G AI Smartphone (Titanium Gray, 12GB, 512GB Storage)",
                                              product['name'].toString(),
                                              style:
                                              const TextStyle(fontSize: 20),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Text(
                                        ' Type',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(width: 3),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 2),
                                          child: SizedBox(
                                            width: 50,
                                            child: Center(
                                              child: Text(
                                                'Normal',
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(width: 8),
                                      const Text(
                                        ' Unit',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(width: 3),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 2),
                                          child: SizedBox(
                                            width: 58,
                                            child: Center(
                                              child: Text(
                                                unit,
                                                maxLines: 1,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(width: 8),
                                      const Text(
                                        ' Qty',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(width: 3),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffffffff),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 2),
                                          child: SizedBox(
                                            width: 30,
                                            child: Center(
                                              child: Text(
                                                product['qty'],
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // const SizedBox(width: 8),
                                      const Text(
                                        ' Rate',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffffffff),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3, vertical: 2),
                                          child: Center(
                                            child: SizedBox(
                                              width: 50,
                                              child: Center(
                                                child: Text(
                                                  product['price'].toString(),
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('No Data'));
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Discount',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 15),
                  DiscountTypeContainer(
                    text: 'AMOUNT',
                    isActive: true,
                  ),
                  DiscountTypeContainer(
                    text: 'PERCENTAGE',
                    isActive: false,
                  ),
                  SizedBox(width: 15),
                  DiscountAmountContainer(amount: ''),
                ],
              ),
            ),
            const Spacer(),
            const SummarySection(),
            const SizedBox(height: 50),
            Center(
              child: GestureDetector(
                onTap: () async {
                  await clearProductList();
                  showPopup(context);
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (builder) => Home(),
                  // ));
                },
                child: const SaveButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountTypeContainer extends StatelessWidget {
  final String text;
  final bool isActive;

  const DiscountTypeContainer({
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xff2a55ef) : const Color(0xffffffff),
        borderRadius: BorderRadius.only(
          bottomLeft: isActive ? Radius.circular(5) : Radius.zero,
          topLeft: isActive ? Radius.circular(5) : Radius.zero,
          bottomRight: !isActive ? Radius.circular(5) : Radius.zero,
          topRight: !isActive ? Radius.circular(5) : Radius.zero,
        ),
        border: Border.all(width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SizedBox(
          width: 90,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DiscountAmountContainer extends StatelessWidget {
  final String amount;

  const DiscountAmountContainer({required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(width: 1, color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 60,
              child: Center(
                child: Text(
                  amount,
                  maxLines: 1,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SummarySection extends StatelessWidget {
  const SummarySection();

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 240),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total :300'),
              Text('Tax : 20.00'),
              Text('Round Off : 0.00'),
              Text('Grand Total : 420.00'),
            ],
          ),
        ),
      ],
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff2a55ef),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        border: Border.all(width: 0),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: Text(
          'SAVE',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
