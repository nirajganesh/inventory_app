import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_app/models/expances_model.dart';
import 'package:inventory_app/provider/expances_provider.dart';
import 'package:inventory_app/screens/boxes/update_boxes_bottomsheet.dart';
import 'package:inventory_app/screens/expances/add_expances_bottomsheet.dart';
import 'package:inventory_app/screens/expances/update_expances_bottomsheet.dart';
import 'package:inventory_app/services/api_services_expances.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:inventory_app/constants/api_constants.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class expances_list extends StatefulWidget {
  const expances_list({Key? key}) : super(key: key);

  @override
  _expances_listState createState() => _expances_listState();
}

class _expances_listState extends State<expances_list> {

  bool state=false;
  late String state_checker="false";
  bool state_update=false;
  late String reasons;
  late  String total_price;
  late  String expances_date;
  late String id;
  int total_sales=0;
  TextEditingController searchcontroller=TextEditingController();
  List<expances_model> expances_model_list=[];
  List<expances_model> contain_filter=[];
  bool data_filter=false;
  late expances_provider expances_pro;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchcontroller.addListener(() {
      filter_expances_list();
    });
  }

  Future<Null> refreshlist() async{
    await Future.delayed(Duration(seconds: 2));
  }


  filter_expances_list()
  {
    List<expances_model> _details=[];
    _details.addAll(expances_model_list);
    if(searchcontroller.text.isNotEmpty)
    {
      _details.retainWhere((data_details)
      {
        String searchterm=searchcontroller.text.toLowerCase();
        String name=data_details.reasons.toLowerCase();
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
          _details.addAll(expances_model_list);
        });
      }
    }
  }

  AddData() async {
    var url= Uri.parse(api_constants.host+api_constants.add_expances);
    http.post(url, body: {'reasons':reasons, 'expances_date':expances_date,'total_price':total_price}
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
    var url= Uri.parse(api_constants.host+api_constants.delete_expances);
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
    var url= Uri.parse(api_constants.host+api_constants.update_expances);
    http.post(url, body: {'id':id,'reasons':reasons, 'total_price':total_price,'expances_date':expances_date}
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
    expances_pro=Provider.of<expances_provider>(context,listen:false);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_sharp, color: Colors.white),
          onPressed: (){
            expances_pro.clear_expances();
            Navigator.of(context).pop();
         }
        ),
        title: Text('Expances',style:TextStyle(color:Colors.white),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
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
                    Consumer<expances_provider>(
                      builder: (context,exp,child){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Expances',style: TextStyle(fontSize: 16,color: Colors.black),),
                            Text('₹'+'${exp.total_expances.toString()}',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight:FontWeight.bold),),
                          ],
                        );
                      },
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
                  Text('Expances History',style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),
                  GestureDetector(
                    onTap: (){
                      state=true;
                      state_checker="Add";
                      _displayBottomSheet();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,color:Theme.of(context).primaryColor),
                        Text('Add Expances',style: TextStyle(fontSize: 16,color:Theme.of(context).primaryColor,fontWeight:FontWeight.bold),),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Flexible(
              child: Container(
                  child:FutureBuilder(
                    future:data_filter==true?api_services_expances().getFilterData(expances_model_list,expances_pro):api_services_expances().get_expances(expances_model_list,expances_pro),
                    //future: future_data,
                    builder:(context,snapshot)
                    {
                      if(api_services_expances().c.state_change.toString()=='1')
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
                        if(expances_model_list.length!=0)
                        {
                          return ListView.builder(itemCount: issearching==true?contain_filter.length:expances_model_list.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context,index){
                                expances_model expances_data=issearching==true?contain_filter[index]:expances_model_list[index];
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
                                                        Text(expances_data.reasons,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Expances Date:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text(expances_data.expances_date,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
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
                                                        Text('Total Price:',style: TextStyle(fontSize: 14,color: Colors.black),),
                                                        Text('₹'+expances_data.total_price,style: TextStyle(fontSize: 14,color: Colors.black,fontWeight:FontWeight.bold),),
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        GestureDetector(
                                                          onTap:(){
                                                            state_checker="update";
                                                            state_update=true;
                                                            reasons=expances_data.reasons;
                                                            total_price=expances_data.total_price;
                                                            expances_date=expances_data.expances_date;
                                                            id=expances_data.id;
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
                                                            alertsheet(expances_data.id);
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
        add_expances_bottomsheet(
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
              reasons=add_expances_bottomsheet.resonscontroller.text;
              expances_date=add_expances_bottomsheet.expancesdatecontroller.text;
              total_price=add_expances_bottomsheet.totalpricecontroller.text;

              AddData();
              add_expances_bottomsheet.resonscontroller.clear();
              add_expances_bottomsheet.expancesdatecontroller.clear();
              add_expances_bottomsheet.totalpricecontroller.clear();
              //  c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },
        ): update_expances_bottomsheet(
          close:(){
            state_update=false;
            state_checker="false";
            Navigator.pop(context);
          },
          update:(){
            setState(() {
              expances_model_list.clear();
              state_update=false;
              state_checker="false";
              reasons=update_expances_bottomsheet.resonsdatecontroller.text;
              total_price=update_expances_bottomsheet.totalpricecontroller.text;
              expances_date=update_expances_bottomsheet.expancescontroller.text;
              UpdateData();
              // c.state_change=RxInt(1);
              Navigator.pop(context);
            });
          },reasons: reasons,total_price: total_price,expances_date: expances_date,
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
              "Do yow want to delete the expances in list?",textAlign: TextAlign.center,style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 16,fontFamily:'Montserrat_regular')),
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
                      expances_model_list.clear();
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
