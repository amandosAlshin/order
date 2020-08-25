import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/branchsapi.dart';
part 'branchs_store.g.dart';


class BranchsStore = _BranchsStoreBase with _$BranchsStore;

abstract class _BranchsStoreBase with Store {
  @observable
  BranchsApi _branchsApi;

  @computed
  BranchsApi get branchsApi => _branchsApi;

  @action
  fetchBranchList(String id){
    getBranchs(id).then((branchList){
      _branchsApi = branchList;
    });
  }

  Future<BranchsApi> getBranchs(String id) async{
    try {
      final response = await http.post(ConstsAPI.branchsApiURL, body: {'id': id});
      var decodeJson = jsonDecode(response.body);
      return BranchsApi.fromJson(decodeJson);
    } catch (error,stacktrace) {
      print("Error Branch list" + stacktrace.toString());
      return null;
    }
  }
}