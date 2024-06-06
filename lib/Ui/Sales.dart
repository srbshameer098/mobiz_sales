import 'package:flutter/material.dart';
import 'package:project/Repositiry/Model_Class/mobiz_Model.dart';
class Sales extends StatefulWidget {
  const Sales({super.key,
    required this.product,
  });
  final Mobiz  product;
  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xff2a55ef),
        title: const Text('Sales', style: TextStyle(color: Colors.white,fontSize: 26)),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 8,bottom: 8,),
              child: Row(children: [
                Text('FD CENTER', style: TextStyle(color: Colors.grey,fontSize: 16)),


                SizedBox(width: 164,),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff2a55ef),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)
                     ),
                    border: Border.all(width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: SizedBox(width: 60,
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
                ), Container(
                  decoration: BoxDecoration(
                    color: Color
                      (
                        // 0xff2a55ef
                        0xffffffff
                    ),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5)
                    ),
                    border: Border.all(width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: SizedBox(width: 60,
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


              ],),
            ),

            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 300,
                                child: Text(
                                  'prds',
                                  style: TextStyle(fontSize: 22),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                    Center(
                      child: Row(

                        children: [
                          const Center(
                            child: Text(
                                    ' Type',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                                  ),
                          ),

                          SizedBox(width: 3,),

                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 50,
                                    child:Center(
                                      child: Text('Normal',maxLines: 1,
                                        style: TextStyle( fontWeight: FontWeight.w500,color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Center(
                            child: Text(
                              ' Unit',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                            ),
                          ),



                          SizedBox(width: 3,),

                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 58,
                                    child:Center(
                                      child: Text('Package',maxLines: 1,
                                        style: TextStyle( fontWeight: FontWeight.w500,color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          Text(
                            ' Qty',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                          ),


                          SizedBox(width: 3,),

                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    child:Center(
                                      child: Text(
                                        '1',
                                        maxLines: 1,
                                        style: TextStyle( fontWeight: FontWeight.w500,color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),


                          Text(
                            ' Rate',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.grey),
                          ),



                          SizedBox(width: 5,),

                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              border: Border.all(width: 1, color: Colors.grey),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                     width: 60,
                                    child:Center(
                                      child: Text('2000.00',maxLines: 1,
                                        style: TextStyle( fontWeight: FontWeight.w500,color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),










                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
SizedBox(height: 100,),
Row(children: [

],),



            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2a55ef),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border.all(width: 0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                  child: Text(
                    'SAVE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
