import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/orderapi.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'order_store.g.dart';


//shedule_store
class OrderStore = _OrderStoreBase with _$OrderStore;

abstract class _OrderStoreBase with Store {


  @observable

  MessageOrderApi _messageOrderApi;

  @observable
  bool loading = false;

  @computed
  MessageOrderApi get messageOrderApi => _messageOrderApi;

  @action
  requestPostOrder(String id){
    loading = true;
    postOrder(id).then((message){
      loading = false;
      _messageOrderApi = message;
    });
  }

  Future<MessageOrderApi> postOrder(String id) async{
    SharedPreferences.setMockInitialValues({});
    try {
      String user_hash;
      SharedPreferences prefs  = await SharedPreferences.getInstance();
      if(prefs.getString("user_hash") == null) {
        user_hash = "new";
      }else{
        user_hash = prefs.getString("user_hash");
      }
      final response = await http.post(ConstsAPI.orderApiURL, body: {
        'user_hash': user_hash,
        'service_id': '1687008',
        'service_name': 'Наличные обменные операции',
        'branch_id': '2',
        'branch_name': 'УГД по Бостандыкскому району',
        'branch_adress': 'г. Алматы, Айманова, 191',
        'company_id': '1',
        'company_name': 'КГД'
      });
      var decodeJson = jsonDecode(response.body);
      var messages = MessageOrderApi.fromJson(decodeJson);
      print(prefs.getString('user_hash'));
      if(messages.user_hash != "0"){
        prefs.setString('user_hash', user_hash);
      }
      return messages;
    } catch (error) {
      SharedPreferences prefs  = await SharedPreferences.getInstance();
      print(prefs.getString('user_hash'));
      print("Error Order list" + error.toString());
      return null;
    }
  }
}