import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inventory_app/constants/api_constants.dart';
import 'package:inventory_app/constroller/getcontroller.dart';
import 'package:inventory_app/models/sales_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:inventory_app/provider/sales_provider.dart';
class api_services_sell
{
  final getcontroller c = Get.put(getcontroller());
  Future get_sales(List<sales_model> sales_model_list,sales_provider sales_pro) async
  {
    sales_pro.clear_sales();
    var response = await http.post(Uri.parse(api_constants.host+api_constants.sales_list));
    var data = jsonDecode(response.body);
    var dataarray=data['store'];
    sales_model_list.clear();
    print(dataarray);
    for(var salesdata in dataarray)
    {
      sales_model listdata=sales_model(salesdata['id'],salesdata['retailer_name'],salesdata['base_price'],salesdata['quantity'],salesdata['total_price'],salesdata['due_date'],salesdata['advance'],salesdata['contact']);
      sales_model_list.add(listdata);
      sales_pro.calculate_sales(int.parse(salesdata['total_price']));
      sales_pro.calculate_advance(int.parse(salesdata['advance']));
    }
    return sales_model_list;
  }

  Future getFilterData(List<sales_model> sales_model_list,sales_provider sales_pro) async {
    sales_pro.clear_sales();
    var response = await http.post(Uri.parse(api_constants.host+api_constants.sales_list));
    var data = jsonDecode(response.body);
    var dataarray=data['store'];
    sales_model_list.clear();
    for(var salesdata in dataarray)
    {
      sales_model listdata=sales_model(salesdata['id'],salesdata['retailer_name'],salesdata['base_price'],salesdata['quantity'],salesdata['total_price'],salesdata['due_date'],salesdata['advance'],salesdata['contact']);
      sales_model_list.add(listdata);
      sales_pro.calculate_sales(int.parse(salesdata['total_price']));
      sales_pro.calculate_advance(int.parse(salesdata['advance']));
    }
    c.state_change=RxInt(0);
    return sales_model_list;
  }





}