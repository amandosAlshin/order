import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// For changing the language
class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          backgroundColor: Color.fromRGBO(38, 81, 158, 1),
          appBar: AppBar(
          title: Text("Выбирите время"),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          ),
          body: Observer(
            name: "Order",
            builder: (BuildContext context) {
              return SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 245, 248, 1),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: <Widget>[
                                ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('КГД', style: TextStyle(fontWeight: FontWeight.bold,),),
                                      subtitle: Text('Комитет государственных Доходов', style: TextStyle(fontWeight: FontWeight.w500),),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10, right: 16),
                          child: Text("Отделения",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),),
                        ),
                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: <Widget>[
                                ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('УГД по Ауэзовскому району'),
                                      subtitle: Text('г. Алматы, Алтынсарина проспект, 23'),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10, right: 16),
                          child: Text("Услуга",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),),
                        ),
                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 10),
                            child: Column(
                              children: <Widget>[
                                ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    ListTile(
                                      title: Text('Кассовые Операции'),
                                      subtitle: Text('Денежные переводы'),
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10, right: 16),
                          child: Text("Выбирите дату",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),),
                        ),
                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: <Widget>[
                                DateTimeField(
                                  format: format,
                                  textAlign: TextAlign.left,
                                  initialValue: DateTime.now().add(new Duration(minutes: 30)),
                                  onShowPicker: (context, currentValue) async {
                                    final date = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        initialDate: currentValue ?? DateTime.now(),
                                        lastDate: DateTime.now().add(new Duration(days: 40))
                                    );
                                    if (date != null) {
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime:TimeOfDay.fromDateTime(currentValue ?? DateTime.now().add(new Duration(minutes: 30))),
                                      );
                                      return DateTimeField.combine(date, time);
                                    } else {
                                      return currentValue;
                                    }
                                  },
                                ),
                            ])
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10, right: 16),

                          child: Center(
                            child: FlatButton(
                              color: Color.fromRGBO(38, 81, 158, 1),
                              textColor: Colors.white,
                              padding: EdgeInsets.all(12.0),
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Создать билет",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  )
              );
            }
          )
      );
  }
}
