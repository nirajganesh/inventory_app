import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
class add_expances_bottomsheet extends StatefulWidget {

  final VoidCallback close;
  final VoidCallback submit;
  static TextEditingController clientcontroller=TextEditingController();
  static TextEditingController subtitlecontroller=TextEditingController();
  static TextEditingController resonscontroller=TextEditingController();
  static TextEditingController expancesdatecontroller=TextEditingController();
  static TextEditingController totalpricecontroller=TextEditingController();

  add_expances_bottomsheet
      ({
    required this.close,
    required this.submit,
    Key? key}) : super(key: key);


  @override
  _add_expances_bottomsheetState createState() => _add_expances_bottomsheetState();
}

class _add_expances_bottomsheetState extends State<add_expances_bottomsheet> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: HexColor("#ffffff"),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          )
      ),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(child: Divider(color: HexColor("#0c0c0c"),height: 4,)),
                )
              ],
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(onPressed: widget.close,color: Colors.white,elevation: 0,
                  child: Icon(Icons.clear,color: Colors.black,),
                ),
              ],
            ),
            Center(
              child: Text(
                "Add Expances",style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 18,fontWeight:FontWeight.bold,fontFamily:'Montserrat_bold')),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right:15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color:HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: add_expances_bottomsheet.resonscontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.dashboard,
                        color: Colors.black38,
                      ),
                      hintText: 'Reasons Name..',
                      hintStyle: TextStyle(
                          color: Colors.black38,fontFamily:'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right:15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color:HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller:add_expances_bottomsheet.totalpricecontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.money,
                        color: Colors.black38,
                      ),
                      hintText: 'Total Price',
                      hintStyle: TextStyle(
                          color: Colors.black38,fontFamily:'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:15.0,right:15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color:HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller:add_expances_bottomsheet.expancesdatecontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black38,
                      ),
                      hintText: 'Expances date..',
                      hintStyle: TextStyle(
                          color: Colors.black38,fontFamily:'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0,right:12.0,bottom: 10),
                    child: Container(
                      child:  RaisedButton(
                        padding: EdgeInsets.only(top: 12, bottom:12),
                        onPressed:(){
                          check_data();
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        color:Theme.of(context).primaryColor,
                        child: Text(
                          'Add Expances',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat_regular'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  check_data() {
    if(add_expances_bottomsheet.resonscontroller.text.toString()=='')
    {
      Fluttertoast.showToast(
          msg: "Please enter the reasons name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    else
    {
      widget.submit();
    }
  }
}
