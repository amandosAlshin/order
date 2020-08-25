import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/servicesapi.dart';
part 'service_store.g.dart';


class ServiceStore = _ServiceStoreBase with _$ServiceStore;

abstract class _ServiceStoreBase with Store {
  @observable

  ServicesApi _servicesApi;

  @computed
  ServicesApi get servicesApi => _servicesApi;

  @action
  fetchServicesList(String id){
    getServices(id).then((servicesList){
      _servicesApi = servicesList;
    });
  }

  Future<ServicesApi> getServices(String id) async{
    try {
      final response = await http.post(ConstsAPI.servicesApiURL, body: {'branchId': id});
      var decodeJson = jsonDecode(response.body);
      return ServicesApi.fromJson(decodeJson);
    } catch (error,stacktrace) {
      print("Error Services list" + stacktrace.toString());
      return null;
    }
  }
}