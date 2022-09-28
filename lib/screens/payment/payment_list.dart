import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_app/screens/expances/update_expances_bottomsheet.dart';
import 'package:inventory_app/screens/payment/add_payment_bottomsheet.dart';
import 'package:inventory_app/screens/payment/update_payment_bottomsheet.dart';
class payment_list extends StatefulWidget {
  
  
  const payment_list({Key? key}) : super(key: key);

  @override
  _payment_listState createState() => _payment_listState();
}

class _payment_listState extends State<payment_list> {

  bool state=false;
  late String state_checker="false";
  bool state_update=false;
  late  String clientname;
  late  String subtitle;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        title: Text('Payment',style:TextStyle(color:Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Payment',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('₹1000',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Payment History',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      state=true;
                      state_checker="Add";
                      _displayBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,color:Theme.of(context).primaryColor),
                        Text('Add Payment',style: TextStyle(fontSize: 16,color:Theme.of(context).primaryColor,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reasons:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('24/02/2022',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('₹155',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  state_checker="update";
                                  state_update=true;
                                  clientname="Chocolate";
                                  subtitle="Sample";
                                  _displayBottomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffFFA74D),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.edit,color: Colors.white,)),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  alertsheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffE71157),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.delete,color: Colors.white,)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reasons:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('24/02/2022',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('₹155',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  state_checker="update";
                                  state_update=true;
                                  clientname="Chocolate";
                                  subtitle="Sample";
                                  _displayBottomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffFFA74D),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.edit,color: Colors.white,)),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  alertsheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffE71157),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.delete,color: Colors.white,)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reasons:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('24/02/2022',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('₹155',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  state_checker="update";
                                  state_update=true;
                                  clientname="Chocolate";
                                  subtitle="Sample";
                                  _displayBottomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffFFA74D),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.edit,color: Colors.white,)),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  alertsheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffE71157),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.delete,color: Colors.white,)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Reasons:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('24/02/2022',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Amount:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('₹155',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap:(){
                                  state_checker="update";
                                  state_update=true;
                                  clientname="Chocolate";
                                  subtitle="Sample";
                                  _displayBottomSheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffFFA74D),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.edit,color: Colors.white,)),
                                ),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  alertsheet();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:const Color(0xffE71157),
                                  ),
                                  child: const Padding(
                                      padding: EdgeInsets.all(3),
                                      child: Icon(Icons.delete,color: Colors.white,)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayBottomSheet()
  {
    showModalBottomSheet(context: context, enableDrag: true,builder: (BuildContext co){
      return Container(
        child:state_checker!="false"? state_checker=="Add"?
        add_payment_bottomsheet(
          close:(){
            // setState(() {
            state=false;
            state_checker="false";
            Navigator.pop(context);
            //});
          },
          submit:(){
            setState(() {
              // data_details.clear();
              state=false;
              state_checker="false";
              clientname=add_payment_bottomsheet.clientcontroller.text;
              if(add_payment_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=add_payment_bottomsheet.subtitlecontroller.text;
              }
              // _AddData();
              add_payment_bottomsheet.clientcontroller.clear();
              add_payment_bottomsheet.subtitlecontroller.clear();
              //  c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },
        ): update_payment_bottomsheet(
          close:(){
            state_update=false;
            state_checker="false";
            Navigator.pop(context);
          },
          update:(){
            setState(() {
              // data_details.clear();
              state_update=false;
              state_checker="false";
              clientname=update_payment_bottomsheet.clientcontroller.text;
              if(update_payment_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=update_payment_bottomsheet.subtitlecontroller.text;
              }
              // _UpdateData();
              // c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },clientname: clientname,subtitle: subtitle,
        ):null,
      );
    });
  }

  void alertsheet()
  {
    showDialog(
        context: context,
        builder:(ctx)=>AlertDialog(
          title: Center(
            child: Text(
              "Alert for Delete",style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 18,fontWeight:FontWeight.bold,fontFamily:'Montserrat_bold')),
            ),
          ),
          content: Padding(
            padding: const EdgeInsets.only(left:12.0,right:12.0),
            child: Text(
              "Do yow want to delete the payment in list?",textAlign: TextAlign.center,style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 16,fontFamily:'Montserrat_regular')),
            ),
          ),

          actions: <Widget>[
            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color:Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Text("No"),
                ),
                SizedBox(width:6),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(ctx).pop();
                      // data_details.clear();
                      state=false;
                      // id=member_data.id;
                      // _DeleteData();
                      //  c.state_change=RxInt(1);
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: HexColor("#F30808"),
                  child: Text("Yes",style:(TextStyle(color: Colors.white)),),
                ),
              ],
            )
          ],
        )
    );
  }
}
