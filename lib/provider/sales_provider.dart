import 'package:flutter/cupertino.dart';

class sales_provider extends ChangeNotifier
{
  int total_sales=0;
  int total_advance=0;
  void calculate_sales(int total)
  {
    total_sales=total_sales+total;
    notifyListeners();
  }
  void calculate_advance(int total)
  {
    total_advance=total_advance+total;
    notifyListeners();
  }
  void clear_sales()
  {
    total_sales=0;
    total_advance=0;
  }
}