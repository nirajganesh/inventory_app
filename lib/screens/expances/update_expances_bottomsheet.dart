import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
class update_expances_bottomsheet extends StatefulWidget {

  final VoidCallback close;
  final VoidCallback update;
  static TextEditingController clientcontroller=TextEditingController();
  static TextEditingController subtitlecontroller=TextEditingController();
  static TextEditingController resonsdatecontroller=TextEditingController();
  static TextEditingController totalpricecontroller=TextEditingController();
  static TextEditingController expancescontroller=TextEditingController();

  final String reasons;
  final String total_price;
  final String expances_date;
  const update_expances_bottomsheet({
    required this.close,
    required this.update,
    required this.reasons,
    required this.total_price,
    required this.expances_date,
    Key? key}) : super(key: key);


  @override
  _update_expances_bottomsheetState createState() => _update_expances_bottomsheetState();
}

class _update_expances_bottomsheetState extends State<update_expances_bottomsheet> {
  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    update_expances_bottomsheet.resonsdatecontroller.text=widget.reasons;
    update_expances_bottomsheet.expancescontroller.text=widget.expances_date;
    update_expances_bottomsheet.totalpricecontroller.text=widget.total_price;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: HexColor("#ffffff"),
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
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
                "Edit Expances",style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 18,fontWeight:FontWeight.bold,fontFamily:'Montserrat_bold')),
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
                child: TextField(controller:update_expances_bottomsheet.resonsdatecontroller,
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
                      hintText: 'Demo1',
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
                child: TextField(controller:update_expances_bottomsheet.totalpricecontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black38,
                      ),
                      hintText: 'Demo1',
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
                child: TextField(controller: update_expances_bottomsheet.expancescontroller,
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
                      hintText: '22/02/2022',
                      hintStyle: TextStyle(
                          color: Colors.black38,fontFamily:'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0,right:12.0,bottom:10,top:10),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        child:  RaisedButton(
                          padding: EdgeInsets.only(top: 12, bottom:12),
                          onPressed: check_data,
                          //widget.update
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          color:Theme.of(context).primaryColor,
                          child: Text(
                            "Save Expances",
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  check_data() {
    if(update_expances_bottomsheet.clientcontroller.text.toString()!='')
    {
      Fluttertoast.showToast(
          msg: "Please enter the resons name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          fontSize: 16.0
      );
    }
    else
    {
      widget.update();
    }
  }
}
