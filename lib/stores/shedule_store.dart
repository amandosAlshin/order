import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/shedulesapi.dart';
part 'shedule_store.g.dart';

//shedule_store
class SheduleStore = _SheduleStoreBase with _$SheduleStore;

abstract class _SheduleStoreBase with Store {
  @observable

  ShedulesApi _shedulesApi;

  @computed
  ShedulesApi get shedulesApi => _shedulesApi;

  @action
  fetchShedulesList(String id){
    getShedules(id).then((shedulesList){

      _shedulesApi = shedulesList;
    });
  }

  Future<ShedulesApi> getShedules(String id) async{
    try {
      final response = await http.post(ConstsAPI.sheduleApiURL, body: {'branchId': id});
      var decodeJson = jsonDecode(response.body);
      return ShedulesApi.fromJson(decodeJson);
    } catch (error,stacktrace) {
      print("Error Shedules list" + stacktrace.toString());
      return null;
    }
  }
}