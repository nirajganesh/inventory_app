import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/screens/boxes/boxes_list.dart';
import 'package:inventory_app/screens/dealers/dealers_list.dart';
import 'package:inventory_app/screens/expances/expances_list.dart';
import 'package:inventory_app/screens/orders/orders_list.dart';
import 'package:inventory_app/screens/payment/payment_list.dart';
import 'package:inventory_app/screens/retailers/retailers_list.dart';
import 'package:inventory_app/screens/sell/sell_list.dart';
import 'package:inventory_app/screens/stock/stock_list.dart';
class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: new IconButton(
        //   icon: new Icon(Icons.menu, color: Colors.white),
        //  onPressed: ()=> Navigator.of(context).pop(),
        // ),
        title: Text('Dashboard',style:TextStyle(color:Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hi,Admin',style: TextStyle(fontSize: 20,color: Colors.black),),
                        Text('HAVE A NICE DAY',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                        Text('SUNDAY 19FEB',style: TextStyle(fontSize: 12,color: Colors.black),),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset('images/profile.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,bottom: 10,left:20,right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>stock_list()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/inventory.png'),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('1050 KG',style: TextStyle(fontSize: 22,color: Colors.black),),
                                Text('STOCK',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                SizedBox(height: 10,),
                                Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>sell_list()),);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset('images/statistics.png'),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('₹3400',style: TextStyle(fontSize: 22,color: Colors.black),),
                                  Text('SALES',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                  SizedBox(height: 10,),
                                  Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:20,bottom: 10,left:20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>boxes_list()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/box.png'),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('40 Pcs',style: TextStyle(fontSize: 22,color: Colors.black),),
                                Text('BOXES',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                SizedBox(height: 10,),
                                Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>orders_list()),);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset('images/gift.png'),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('2',style: TextStyle(fontSize: 22,color: Colors.black),),
                                  Text('ORDERS',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                  SizedBox(height: 10,),
                                  Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,bottom:10,left:20,right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>expances_list()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/expances.png'),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('₹2000',style: TextStyle(fontSize: 22,color: Colors.black),),
                                Text('EXPANCES',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                SizedBox(height: 10,),
                                Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>payment_list()),);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset('images/payment.png'),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('₹3400',style: TextStyle(fontSize: 22,color: Colors.black),),
                                  Text('PAYMENT',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                  SizedBox(height: 10,),
                                  Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,bottom:10,left:20,right:20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>retailers_list()),);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(2, 2),
                            blurRadius: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Image.asset('images/clipboard.png'),
                              ],
                            ),
                            SizedBox(width: 20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('105',style: TextStyle(fontSize: 22,color: Colors.black),),
                                Text('RETAILER',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                SizedBox(height: 10,),
                                Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>dealers_list()),);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[
                            BoxShadow(
                              offset: Offset(2, 2),
                              blurRadius: 12,
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                            )
                          ],
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset('images/clipboard.png'),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('400',style: TextStyle(fontSize: 22,color: Colors.black),),
                                  Text('DEALER',style: TextStyle(fontSize: 16,color: Color(0xff333333)),),
                                  SizedBox(height: 10,),
                                  Text('10 New',style: TextStyle(fontSize: 14,color: Colors.black),),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
