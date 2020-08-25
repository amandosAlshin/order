import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/orderapi.dart';
part 'orders_store.g.dart';

//shedule_store
class OrdersStore = _OrdersStoreBase with _$OrdersStore;

abstract class _OrdersStoreBase with Store {
  @observable

  MessageOrderApi _messageOrderApi;

  @computed
  MessageOrderApi get messageOrderApi => _messageOrderApi;

  @action
  fetchOrder(String user_hash,int service_id, String service_name,int branch_id,String branch_name,String branch_adress,int company_id,String company_name){
    getOrder(user_hash,service_id,service_name,branch_id,branch_name,branch_adress,company_id,company_name).then((message){
      _messageOrderApi = message;
    });
  }

  Future<MessageOrderApi> getOrder(String user_hash,int service_id, String service_name,int branch_id,String branch_name,String branch_adress,int company_id,String company_name) async{
    try {
      final response = await http.post(ConstsAPI.orderApiURL,
          body: {
            'user_hash': user_hash,
            'service_id': service_id,
            'service_name': service_name,
            'branch_id': branch_id,
            'branch_name': branch_name,
            'branch_adress': branch_adress,
            'company_id': company_id,
            'company_name': company_name
          });
      var decodeJson = jsonDecode(response.body);
      return MessageOrderApi.fromJson(decodeJson);
    } catch (error,stacktrace) {
      print("Error Order" + stacktrace.toString());
      return null;
    }
  }
}