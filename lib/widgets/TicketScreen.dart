import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:order/stores/category_store.dart';


class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  CategoryStore categoryStore;

  @override
  void initState() {
    super.initState();
    categoryStore = CategoryStore();
    categoryStore.fetchCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListaHomePage',
                      builder: (BuildContext context) {
                        return (categoryStore.categoryApi != null)
                            ? ListView.builder(
                          itemCount: categoryStore.categoryApi.categories.length,
                          itemBuilder: (context, index) {
                            return ListTile(title: Text(categoryStore.categoryApi.categories[index].name),);
                          },
                        )
                            : Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
