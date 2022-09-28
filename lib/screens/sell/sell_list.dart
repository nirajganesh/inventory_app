import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_app/constants/api_constants.dart';
import 'package:inventory_app/constroller/getcontroller.dart';
import 'package:inventory_app/models/sales_model.dart';
import 'package:inventory_app/provider/sales_provider.dart';
import 'package:inventory_app/screens/sell/add_sell_bottomsheet.dart';
import 'package:inventory_app/screens/sell/update_sell_bottomsheet.dart';
import 'package:inventory_app/services/api_services_sell.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class sell_list extends StatefulWidget {
  const sell_list({Key? key}) : super(key: key);

  @override
  _sell_listState createState() => _sell_listState();
}

class _sell_listState extends State<sell_list> {

  bool state=false;
  late String state_checker="false";
  bool state_update=false;
  late  String retailername;
  late  String baseprice;
  late  String total_price;
  late  String due_date;
  late  String quantity;
  late  String advance;
  late  String subtitle;
  late String contact;
  late String id;
  int total_sales=0;
  TextEditingController searchcontroller=TextEditingController();
  List<sales_model> sales_model_list=[];
  List<sales_model> contain_filter=[];
  bool data_filter=false;
  late sales_provider sales_pro;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchcontroller.addListener(() {
      filter_sales_list();
    });
  }

  Future<Null> refreshlist() async{
    await Future.delayed(Duration(seconds: 2));
  }


  filter_sales_list()
  {
    List<sales_model> _details=[];
    _details.addAll(sales_model_list);
    if(searchcontroller.text.isNotEmpty)
    {
      _details.retainWhere((data_details){
        String searchterm=searchcontroller.text.toLowerCase();
        String name=data_details.retailer_name.toLowerCase();
        return name.contains(searchterm);
      });
      setState(() {
        contain_filter.clear();
        contain_filter=_details;
      });
    }
    else
    {
      if(data_filter==true)
      {
        setState(() {
          _details.clear();
          // _details.addAll(data_details);
        });
      }
      else
      {
        setState(() {
          _details.addAll(sales_model_list);
        });
      }
    }
  }

  AddData() async {
    var url= Uri.parse(api_constants.host+api_constants.add_sales);
    http.post(url, body: {'retailer_name':retailername, 'base_price':baseprice,'due_date':due_date,'quantity':quantity,'total_price':total_price,'advance':advance,'contact':contact}
    ).then((res){
      if(res.statusCode==200)
      {
        setState(() {
          data_filter=true;
        });
        Fluttertoast.showToast(
            msg: "Successfully Added",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
      else
      {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
    });
  }

  DeleteData(String id) async {
    var url= Uri.parse(api_constants.host+api_constants.delete_sales);
    http.post(url, body: {'id':id}
    ).then((res){
      if(res.statusCode==200)
      {
        setState(() {
          data_filter=true;
        });
        Fluttertoast.showToast(
            msg: "Successfully delete data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
      else
      {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
    });
  }

  UpdateData() async {
    var url= Uri.parse(api_constants.host+api_constants.update_sales);
    http.post(url, body: {'id':id,'retailer_name':retailername, 'base_price':baseprice,'due_date':due_date,'quantity':quantity,'total_price':total_price,'advance':advance,'contact':contact}
    ).then((res){
      if(res.statusCode==200)
      {
        setState(() {
          data_filter=true;
        });
        Fluttertoast.showToast(
            msg: "Successfully Update Data",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
      else
      {
        Fluttertoast.showToast(
            msg: "Failed",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16.0
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    bool issearching=searchcontroller.text.isNotEmpty;
    sales_pro=Provider.of<sales_provider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: ()=> Navigator.of(context).pop(),
        ),
        title: Text('Sell',style:TextStyle(color:Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
      Column(
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
                child:
                    Consumer<sales_provider>(
                      builder: (context,sales_pro,child){
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Sales',style: TextStyle(fontSize: 16,color: Colors.black),),
                                Text('₹'+'${sales_pro.total_sales.toString()}',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total Advance',style: TextStyle(fontSize: 16,color: Colors.black),),
                                Text('₹'+'${sales_pro.total_advance.toString()}',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex:5,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 44,
                        child: TextField(controller: searchcontroller,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.black87,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.black38,
                              ),
                              hintText: 'Enter the retailer name..',
                              hintStyle: TextStyle(
                                  color: Colors.black38,fontFamily:'Montserrat'
                              )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30,),
                    Expanded(
                      flex:1,
                      child: Container(
                        child:Container(
                          width: 50,
                          // ignore: deprecated_member_use
                          child:FlatButton(
                            padding: EdgeInsets.only(top: 12, bottom:12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Theme.of(context).primaryColor,
                            onPressed: () {
                            },
                            child: Icon(Icons.search,color: Colors.white,),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sell History',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      state=true;
                      state_checker="Add";
                      _displayBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,color:Theme.of(context).primaryColor),
                        Text('Add Sell',style: TextStyle(fontSize: 16,color:Theme.of(context).primaryColor,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                  child:FutureBuilder(
                    future:data_filter==true?api_services_sell().getFilterData(sales_model_list,sales_pro):api_services_sell().get_sales(sales_model_list,sales_pro),
                    //future: future_data,
                    builder:(context,snapshot)
                    {
                      if(api_services_sell().c.state_change.toString()=='1')
                      {
                        return Container(
                          child: Center(
                            child:Shimmer.fromColors(baseColor: HexColor("#ffffff"), highlightColor: HexColor("#16697a").withOpacity(0.1),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      if(snapshot.connectionState==ConnectionState.waiting)
                      {
                        return Container(
                          child: Center(
                            child:Shimmer.fromColors(baseColor: HexColor("#ffffff"), highlightColor: HexColor("#16697a").withOpacity(0.1),
                              child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),

                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      child:Card(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Container(
                                            child:Column(
                                              children: <Widget>[
                                                Row(
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children:<Widget> [
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 50,
                                                      height: 10,
                                                      alignment: Alignment.topLeft,
                                                      decoration: BoxDecoration(
                                                        color: Colors.black26,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      else
                      {
                        if(sales_model_list.length!=0)
                        {
                          return ListView.builder(itemCount: issearching==true?contain_filter.length:sales_model_list.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                sales_model sales_data=issearching==true?contain_filter[index]:sales_model_list[index];
                                return Padding(
                                  padding: EdgeInsets.only(top: 0,bottom: 8,left:5,right: 5),
                                  child:GestureDetector(
                                    onTap: (){
                                    //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) =>
                                     //     clientdetails(clientname:member_data.name,amount:member_data.amount,id:member_data.id,account:member_data.cat,nav_screen:nav_screen)), (Route<dynamic> route) => false);
                                    },
                                    child: Card(
                                      color: HexColor("#ffffff"),
                                      shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                      child:
                                      Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Retailer Name:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text(sales_data.retailer_name,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Base Price:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text('₹'+sales_data.base_price,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Due Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text(sales_data.due_date,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                                                        Text('Quantity:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text(sales_data.quantity,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Total Price:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text('₹'+sales_data.total_price,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Advance:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        int.parse(sales_data.total_price)==int.parse(sales_data.advance)?
                                                        Text('₹'+sales_data.advance,style: TextStyle(fontSize: 14,color: HexColor("#BBD686"),fontWeight:FontWeight.bold),):
                                                        Text('₹'+sales_data.advance,style: TextStyle(fontSize: 14,color: HexColor("#FFC15E"),fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),


                                                  ],
                                                ),
                                                SizedBox(height: 10,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Contact:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text(sales_data.contact,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        GestureDetector(
                                                          onTap:(){
                                                            state_checker="update";
                                                            state_update=true;
                                                            retailername=sales_data.retailer_name;
                                                            baseprice=sales_data.base_price;
                                                            total_price=sales_data.total_price;
                                                            quantity=sales_data.quantity;
                                                            due_date=sales_data.due_date;
                                                            advance=sales_data.advance;
                                                            contact=sales_data.contact;
                                                            id=sales_data.id;
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
                                                            alertsheet(sales_data.id);
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
                                                )
                                              ],
                                            ),
                                          ),
                                    ),
                                  ),
                                );
                              });
                        }
                        else
                        {
                          return Container(
                            color: Colors.white,
                            width: double.infinity,
                            height: double.infinity,
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:<Widget>[
                                Text('No data found',style: TextStyle(color: Colors.white,fontSize: 16),),
                              ],
                            ),
                          );
                        }
                      }
                    },
                  )
              ),),
          ],
        ),
    );
  }

  void _displayBottomSheet()
  {
    showModalBottomSheet(context: context, enableDrag: true,builder: (BuildContext co){
      return Container(
        child:state_checker!="false"? state_checker=="Add"?
        add_sell_bottomsheet(
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
              retailername=add_sell_bottomsheet.retailercontroller.text;
              baseprice=add_sell_bottomsheet.basepricecontroller.text;
              due_date=add_sell_bottomsheet.due_datecontroller.text;
              total_price=add_sell_bottomsheet.total_pricecontroller.text;
              quantity=add_sell_bottomsheet.quantitycontroller.text;
              advance=add_sell_bottomsheet.advancecontroller.text;
              contact=add_sell_bottomsheet.contactcontroller.text;

              AddData();
              add_sell_bottomsheet.retailercontroller.clear();
              add_sell_bottomsheet.basepricecontroller.clear();
              add_sell_bottomsheet.due_datecontroller.clear();
              add_sell_bottomsheet.total_pricecontroller.clear();
              add_sell_bottomsheet.quantitycontroller.clear();
              add_sell_bottomsheet.contactcontroller.clear();
              //  c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },
        ): update_sell_bottomsheet(
          close:(){
            state_update=false;
            state_checker="false";
            Navigator.pop(context);
          },
          update:(){
            setState(() {
              sales_model_list.clear();
              state_update=false;
              state_checker="false";
              retailername=update_sell_bottomsheet.retailercontroller.text;
              baseprice=update_sell_bottomsheet.basepricecontroller.text;
              total_price=update_sell_bottomsheet.total_pricecontroller.text;
              due_date=update_sell_bottomsheet.due_datecontroller.text;
              quantity=update_sell_bottomsheet.quantitycontroller.text;
              advance=update_sell_bottomsheet.advancecontroller.text;
              contact=update_sell_bottomsheet.contactcontroller.text;
              UpdateData();
              // c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },retailername: retailername,baseprice: baseprice,total_price: total_price,due_date: due_date,quantity: quantity,advance: advance,contact: contact,
        ):null,
      );
    });
  }

  void alertsheet(String id)
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
              "Do yow want to delete the sell in list?",textAlign: TextAlign.center,style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 16,fontFamily:'Montserrat_regular')),
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
                      sales_model_list.clear();
                      state=false;
                      DeleteData(id);
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
