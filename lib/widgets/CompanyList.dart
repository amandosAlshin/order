import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:order/consts/consts_api.dart';
import 'package:order/models/companyapi.dart';
import 'package:order/stores/companies_store.dart';

import 'BranchsList.dart';

class CompanyList extends StatefulWidget {
  final int selectedCategory;
  final int countCompanyCategory;

  const CompanyList({Key key, @required this.selectedCategory, @required this.countCompanyCategory}) : super(key: key);
  @override
  _CompanyListState createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {

  CompanyStore  companyStore;
  @override
  void initState() {
    super.initState();

    companyStore = CompanyStore();
    companyStore.fetchCompanyList();
  }
  Widget _buildCompanyItem(BuildContext context, companies ) {
    return GestureDetector(
      onTap: () { Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BranchsList(
                id: companies.id,
                name: companies.name,
                description: companies.discription,
                logo: companies.logo,
              )));},
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.all(Radius.circular(18))),
                child: Image.network(
                  ConstsAPI.mainApiURL+companies.logo,
                  width: 45,
                  height: 45,
                ),
                padding: EdgeInsets.all(12),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      companies.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[900]),
                    ),
                    Text(
                      companies.discription,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Observer(
        name: "ListCategory",
        builder: (BuildContext context)
        {
          return (companyStore.companyApi != null)
              ?
                ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Companies companies = _filterByCompanyCategoryId(widget.selectedCategory, companyStore.companyApi.companies)[index];
                      return _buildCompanyItem(context, companies);
                    },
                    itemCount: widget.countCompanyCategory,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    controller: ScrollController(keepScrollOffset: false))

              :
            Center(child: CircularProgressIndicator(),);
          }
    );
  }
}

List<Companies> _filterByCompanyCategoryId(int selectedCategory, companies) {
  List<Companies> resultCompany = List<Companies>();
  if(selectedCategory==0){
    return companies;
  }else{
    for (int i = 0; i < companies.length; i++) {
      if (selectedCategory == companies[i].categoryId) {
        resultCompany.add(companies[i]);
      }
    }
    return resultCompany;
  }

}
