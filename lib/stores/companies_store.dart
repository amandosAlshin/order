import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/companyapi.dart';
part 'companies_store.g.dart';

class CompanyStore = _CompanyStoreBase with _$CompanyStore;

abstract class _CompanyStoreBase with Store {
  @observable
  CompanyApi _companyApi;

  @computed
  CompanyApi get companyApi => _companyApi;

  @action
  fetchCompanyList(){
    getCompany().then((companyList){
      _companyApi = companyList;
    });
  }

  Future<CompanyApi> getCompany() async{
    try {
      final response = await http.get(ConstsAPI.companyApiURL);
      var decodeJson = jsonDecode(response.body);
      return CompanyApi.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Error Company list" + stacktrace.toString());
      return null;
    }
  }
}