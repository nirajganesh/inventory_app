import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_app/constants/api_constants.dart';
import 'package:inventory_app/constroller/getcontroller.dart';
import 'package:inventory_app/models/expances_model.dart';
import 'package:inventory_app/models/sales_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:inventory_app/provider/expances_provider.dart';
import 'package:provider/provider.dart';
class api_services_expances
{
  final getcontroller c = Get.put(getcontroller());
  Future get_expances(List<expances_model> expances_model_list,expances_provider expances_pro) async
  {
    expances_pro.clear_expances();
    var response = await http.post(Uri.parse(api_constants.host+api_constants.expances_list));
    var data = jsonDecode(response.body);
    var dataarray=data['store'];
    expances_model_list.clear();
    print(dataarray);
    for(var expancesdata in dataarray)
    {
      expances_model listdata=expances_model(expancesdata['id'],expancesdata['reasons'],expancesdata['expances_date'],expancesdata['total_price']);
      expances_model_list.add(listdata);
      expances_pro.calculate_expances(int.parse(expancesdata['total_price']));
    }
    return expances_model_list;
  }

  Future getFilterData(List<expances_model> expances_model_list,expances_provider expances_pro) async {
    expances_pro.clear_expances();
    var response = await http.post(Uri.parse(api_constants.host+api_constants.expances_list));
    var data = jsonDecode(response.body);
    var dataarray=data['store'];
    expances_model_list.clear();
    for(var expancesdata in dataarray)
    {
      expances_model listdata=expances_model(expancesdata['id'],expancesdata['reasons'],expancesdata['expances_date'],expancesdata['total_price']);
      expances_model_list.add(listdata);
      expances_pro.calculate_expances(int.parse(expancesdata['total_price']));
    }
    c.state_change=RxInt(0);
    return expances_model_list;
  }
}