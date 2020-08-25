import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/categoryapi.dart';
part 'category_store.g.dart';


class CategoryStore = _CategoryStoreBase with _$CategoryStore;

abstract class _CategoryStoreBase with Store {
  @observable
  CategoryApi _categoryApi;

  @computed
  CategoryApi get categoryApi => _categoryApi;

  @action 
  fetchCategoryList(){
    getCategory().then((categoryList){
      _categoryApi = categoryList;
    });
  }

  Future<CategoryApi> getCategory() async{
    try {
      final response = await http.get(ConstsAPI.categoryApiURL);
      var decodeJson = jsonDecode(response.body);
      return CategoryApi.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Error Category list" + stacktrace.toString());
      return null;
    }
  }
}