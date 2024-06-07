import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Bloc/mobiz_bloc/mobiz_bloc.dart';
import 'package:project/Repositiry/Model_Class/mobiz_Model.dart';

import 'Sales.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
late Mobiz response;
class _HomeState extends State<Home> {
  List<int> _currentIndex = [];
  late Mobiz response;
  late dynamic productid;

  @override
  void initState() {
    BlocProvider.of<MobizBloc>(context).add(FetchMobiz());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff2a55ef),
        title: Text('Selected Products', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<MobizBloc, MobizState>(
        builder: (context,  state) {
          if (state is MobizblocLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is MobizblocError) {
            return Center(child: Text("ERROR"));
          }
          if (state is MobizblocLoaded) {
             response = BlocProvider.of<MobizBloc>(context).mobizModel;

             if (response.data == null || response.data!.isEmpty) {
               return Center(child: Text('No Data'));
             }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: response.data!.length,
              itemBuilder: (BuildContext context, int index) {



                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (builder) => Sales(name: response.data![index].name ?? "name",

                        ),
                      ));
                      productid='${response.data![index].id}';
                      print(productid);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xffc7c6c6),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
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
                                      style: TextStyle(fontSize: 22),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    response.data![index].code.toString(),
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        ' BOX:${response.data![index].secondUnitQty.toString()}',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' | ',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        ' PCS:${response.data![index].baseUnitQty.toString()}',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
            return SizedBox(child: Center(child: Text('No Data')),);
          }
        },
      ),
    );
  }
}
