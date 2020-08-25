import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:order/stores/category_store.dart';
import 'package:order/stores/companies_store.dart';

import 'CompanyList.dart';
class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoryStore categoryStore;
  CompanyStore  companyStore;
  @override
  void initState() {
    super.initState();
    categoryStore = CategoryStore();
    categoryStore.fetchCategoryList();

    companyStore = CompanyStore();
    companyStore.fetchCompanyList();
  }
  int selectedCategory = 0;
  Widget _buildCategoryItem(BuildContext context, CategoryStore categoryStore,index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = categoryStore.categoryApi.categories[index].id;
        });
      },
      child: Row(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                categoryStore.categoryApi.categories[index].id == selectedCategory
                    ?
                Container(
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(categoryStore.categoryApi.categories[index].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
                    ],
                  ),
                )
                    :
                Text(categoryStore.categoryApi.categories[index].name, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.grey[900]),),
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.grey[200], blurRadius: 10.0, spreadRadius: 4.5)]
            ),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        name: "ListCategory",
        builder: (BuildContext context) {
          return (categoryStore.categoryApi != null && companyStore.companyApi != null )
              ?
                  Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        child: ListView.builder(
                            itemCount: categoryStore.categoryApi.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return _buildCategoryItem(context, categoryStore, index);
                            },
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            controller: ScrollController(keepScrollOffset: false)
                        ),
                      ),
                      CompanyList(countCompanyCategory: _countCompanyCategory(selectedCategory,companyStore),selectedCategory: selectedCategory),
                      //CompanyList()
                    ],
                  )
              :
                  Center(child: CircularProgressIndicator(),);
          }
        );
  }
  int _countCompanyCategory(int selectedCategory, CompanyStore companyStore) {
    int count = 0;
    if(selectedCategory == 0){
      return companyStore.companyApi.companies.length;
    }else{
      for (int i = 0; i < companyStore.companyApi.companies.length; i++) {
        if (selectedCategory == companyStore.companyApi.companies[i].categoryId) {
          count = count + 1;
        }
      }
      return count;
    }

  }
}
