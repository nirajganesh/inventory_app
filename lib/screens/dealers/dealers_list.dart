import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_app/screens/dealers/add_dealers_bottomsheet.dart';
import 'package:inventory_app/screens/dealers/update_dealers_bottomsheet.dart';
class dealers_list extends StatefulWidget {


  const dealers_list({Key? key}) : super(key: key);

  @override
  _dealers_listState createState() => _dealers_listState();
}

class _dealers_listState extends State<dealers_list> {

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
        title: Text('Dealers',style:TextStyle(color:Colors.white),),
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
                        Text('Total Dealers',style: TextStyle(fontSize: 16,color: Colors.black),),
                        Text('1000',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
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
                  Text('Dealers History',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      state=true;
                      state_checker="Add";
                      _displayBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,color:Theme.of(context).primaryColor),
                        Text('Add Dealers',style: TextStyle(fontSize: 16,color:Theme.of(context).primaryColor,fontWeight:FontWeight.bold),),
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
                              Text('Dealer Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Raipur',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Join Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Total Retailer:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('300',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('7999107995',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                              Text('Dealer Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Raipur',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Join Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Total Retailer:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('300',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('7999107995',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                              Text('Dealer Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Raipur',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Join Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Total Retailer:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('300',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('7999107995',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                              Text('Dealer Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Demo1',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Area:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('Raipur',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Join Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
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
                              Text('Total Retailer:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('300',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact:',style: TextStyle(fontSize: 14,color: Colors.black),),
                              Text('7999107995',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
        add_dealers_bottomsheet(
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
              clientname=add_dealers_bottomsheet.clientcontroller.text;
              if(add_dealers_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=add_dealers_bottomsheet.subtitlecontroller.text;
              }
              // _AddData();
              add_dealers_bottomsheet.clientcontroller.clear();
              add_dealers_bottomsheet.subtitlecontroller.clear();
              //  c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },
        ): update_dealers_bottomsheet(
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
              clientname=update_dealers_bottomsheet.clientcontroller.text;
              if(update_dealers_bottomsheet.subtitlecontroller.text=='')
              {
                subtitle='No';
              }
              else
              {
                subtitle=update_dealers_bottomsheet.subtitlecontroller.text;
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
              "Do yow want to delete the dealers in list?",textAlign: TextAlign.center,style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 16,fontFamily:'Montserrat_regular')),
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
