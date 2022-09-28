import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
class update_sell_bottomsheet extends StatefulWidget {
  final VoidCallback close;
  final VoidCallback update;
  static TextEditingController retailercontroller=TextEditingController();
  static TextEditingController basepricecontroller=TextEditingController();
  static TextEditingController quantitycontroller=TextEditingController();
  static TextEditingController due_datecontroller=TextEditingController();
  static TextEditingController total_pricecontroller=TextEditingController();
  static TextEditingController advancecontroller=TextEditingController();
  static TextEditingController contactcontroller=TextEditingController();
  final String retailername;
  final String baseprice;
  final String total_price;
  final String due_date;
  final String quantity;
  final String advance;
  final String contact;
  const update_sell_bottomsheet({
    required this.close,
    required this.update,
    required this.retailername,
    required this.baseprice,
    required this.total_price,
    required this.due_date,
    required this.quantity,
    required this.advance,
    required this.contact,
    Key? key}) : super(key: key);


  @override
  _update_sell_bottomsheetState createState() => _update_sell_bottomsheetState();
}

class _update_sell_bottomsheetState extends State<update_sell_bottomsheet> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    update_sell_bottomsheet.retailercontroller.text=widget.retailername;
    update_sell_bottomsheet.basepricecontroller.text=widget.baseprice;
    update_sell_bottomsheet.total_pricecontroller.text=widget.total_price;
    update_sell_bottomsheet.quantitycontroller.text=widget.quantity;
    update_sell_bottomsheet.due_datecontroller.text=widget.due_date;
    update_sell_bottomsheet.advancecontroller.text=widget.advance;
    update_sell_bottomsheet.contactcontroller.text=widget.contact;
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
                "Edit Sell",style: (TextStyle(color: HexColor("#0c0c0c"),fontSize: 18,fontWeight:FontWeight.bold,fontFamily:'Montserrat_bold')),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .retailercontroller,
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
                      hintText: 'Retailer Name..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .basepricecontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.monetization_on,
                        color: Colors.black38,
                      ),
                      hintText: 'Base Price..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .due_datecontroller,
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
                      hintText: 'Due date..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .quantitycontroller,
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.confirmation_num,
                        color: Colors.black38,
                      ),
                      hintText: 'Quantity..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .total_pricecontroller,
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
                      hintText: 'Total Price..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .advancecontroller,
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
                      hintText: 'advance..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
                      )
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1.0, color: HexColor("#0c0c0c")),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 44,
                child: TextField(controller: update_sell_bottomsheet
                    .contactcontroller,
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
                      hintText: 'contact..',
                      hintStyle: TextStyle(
                          color: Colors.black38, fontFamily: 'Montserrat'
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
                            "Save sell",
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
    if(update_sell_bottomsheet.retailercontroller.text.toString()=='')
    {
      Fluttertoast.showToast(
          msg: "Please enter the retailer name",
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
