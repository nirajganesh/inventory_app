import 'package:flutter/cupertino.dart';

class expances_provider with ChangeNotifier
{
  int total_expances=0;
  void calculate_expances(int total)
  {
    total_expances=total_expances+total;
    notifyListeners();
  }
  void clear_expances()
  {
    total_expances=0;
  }
}