import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_app/screens/boxes/add_boxes_bottomsheet.dart';
import 'package:inventory_app/screens/boxes/update_boxes_bottomsheet.dart';
class boxes_list extends StatefulWidget {
  const boxes_list({Key? key}) : super(key: key);

  @override
  _boxes_listState createState() => _boxes_listState();
}

class _boxes_listState extends State<boxes_list> {

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
        title: Text('Boxes',style:TextStyle(color:Colors.white),),
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
                        Text('Product Name',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('400 Pcs',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Name2',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('300 Pcs',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Name3',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('700 Pcs',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(height: 2,color: Colors.black,),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Boxes',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('1000 Pcs',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Boxes History',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      state=true;
                      state_checker="Add";
                      _displayBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,color:Theme.of(context).primaryColor),
                        Text('Add Boxes',style: TextStyle(fontSize: 16,color:Theme.of(context).primaryColor,fontWeight:FontWeight.bold),),
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
                              Text('Product Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('47',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Supply Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Supplier Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                              Text('Product Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('47',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Supply Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Supplier Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                              Text('Product Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quantity:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('47',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Supply Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Supplier Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
        add_boxes_bottomsheet(
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
              clientname=add_boxes_bottomsheet.clientcontroller.text;
              if(add_boxes_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=add_boxes_bottomsheet.subtitlecontroller.text;
              }
              // _AddData();
              add_boxes_bottomsheet.clientcontroller.clear();
              add_boxes_bottomsheet.subtitlecontroller.clear();
              //  c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },
        ): update_boxes_bottomsheet(
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
              clientname=update_boxes_bottomsheet.clientcontroller.text;
              if(update_boxes_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=update_boxes_bottomsheet.subtitlecontroller.text;
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
              "Do yow want to delete the boxes in list?",textAlign: TextAlign.center,style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 16,fontFamily:'Montserrat_regular')),
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
