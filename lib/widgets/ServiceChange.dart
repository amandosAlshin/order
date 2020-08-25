import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:order/models/servicesapi.dart';
import 'package:order/stores/service_store.dart';
import 'package:order/stores/shedule_store.dart';
import 'package:order/widgets/OrderScreen.dart';

class ServiceChange extends StatefulWidget {

  final int id;
  const ServiceChange({Key key, @required this.id}) : super(key: key);

  @override
  _ServiceChangeState createState() => _ServiceChangeState();
}

class _ServiceChangeState extends State<ServiceChange> {
  ServiceStore serviceStore;
  SheduleStore sheduleStore;
  @override
  void initState() {
    super.initState();
    sheduleStore = SheduleStore();
    sheduleStore.fetchShedulesList(widget.id.toString());
    serviceStore = ServiceStore();
    serviceStore.fetchServicesList(widget.id.toString());
  }
  _showSheduleDialog(sheduleStore){
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Время работы"),
          content: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ListView.builder(
                    itemBuilder:(BuildContext context, int index) {
                      return (sheduleStore.shedulesApi.today.name  == sheduleStore.shedulesApi.schedules[index].name) ?  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(sheduleStore.shedulesApi.schedules[index].name, style: TextStyle(fontSize: 14, fontWeight:   FontWeight.bold, height: 2),),
                          Text(sheduleStore.shedulesApi.schedules[index].shedule,style: TextStyle(fontSize: 14, fontWeight:  FontWeight.bold, height: 2),),
                        ],
                      )
                      :
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(sheduleStore.shedulesApi.schedules[index].name, style: TextStyle(fontSize: 14, fontWeight:   FontWeight.w400, height: 2),),
                          Text(sheduleStore.shedulesApi.schedules[index].shedule,style: TextStyle(fontSize: 14, fontWeight:  FontWeight.w400, height: 2),),
                        ],
                      );
                    },
                    itemCount: sheduleStore.shedulesApi.schedules.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    controller: ScrollController(keepScrollOffset: false)
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Закрыть!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
  int _countCompanyCategory(int selectedService, ServiceStore serviceStore) {
    int count = 0;
    if(selectedService == 0){
      return serviceStore.servicesApi.services.length;
    }else{
      for (int i = 0; i < serviceStore.servicesApi.services.length; i++) {
        if (selectedService == serviceStore.servicesApi.services[i].parentId) {
          count = count + 1;
        }
      }
      return count;
    }

  }
  List<Services> _filterByServicesParentId(int selectedCategory, serivices) {
    List<Services> resultServices = List<Services>();
    if(selectedCategory==0){
      return serivices;
    }else{
      for (int i = 0; i < serivices.length; i++) {
        if (selectedCategory == serivices[i].parentId) {
          resultServices.add(serivices[i]);
        }
      }
      return resultServices;
    }

  }
  Widget _buildServiceList(data,serviceStore){
    return  ListView.separated(
      padding: const EdgeInsets.all(8.0),
      shrinkWrap: true,
      itemCount: _countCompanyCategory(data,serviceStore),
      itemBuilder: (BuildContext context, int index) {
        Services services = _filterByServicesParentId(data, serviceStore.servicesApi.services)[index];
        return  ListTile(
          dense: true,
          title: Text(services.workName),
          trailing: Icon(Icons.arrow_forward),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
  Widget _showMaterialDialog(BuildContext context,data) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          title: new Text("Material Dialog"),
          content: ListView.separated(
            padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              itemCount: _countCompanyCategory(data,serviceStore),
              itemBuilder: (BuildContext context, int index) {
                Services services = _filterByServicesParentId(data, serviceStore.servicesApi.services)[index];
                return  ListTile(
                  dense: true,
                  title: Text(services.workName),
                  trailing: Icon(Icons.arrow_forward),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close me!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      appBar: AppBar(
        title: Text("Выбирите услугу"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Container(
        child: Observer(
          name: "Services choose",
          builder: (BuildContext context) {
            return (sheduleStore.shedulesApi != null && serviceStore.servicesApi != null)
              ?
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
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
                          margin: EdgeInsets.only(left: 16, top: 16, right: 16),
                          child: Text("Время работы",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),),
                        ),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.symmetric(vertical: 16),
                            child: ListTile(
                              dense: true,
                              title: Text("${sheduleStore.shedulesApi.today.name} ${sheduleStore.shedulesApi.today.shedule}"),
                              trailing: Icon(Icons.arrow_forward),
                              onTap:(){ _showSheduleDialog(sheduleStore);},
                            )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 10, right: 16),
                          child: Text("Услуги",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),),
                        ),
                        Container(
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(vertical: 16),
                          child: ListView.separated(
                            padding: const EdgeInsets.all(8.0),
                            shrinkWrap: true,
                            itemCount:  _countCompanyCategory(serviceStore.servicesApi.services[0].queueId,serviceStore),
                            itemBuilder: (BuildContext context, int index) {
                              Services services = _filterByServicesParentId(serviceStore.servicesApi.services[0].queueId, serviceStore.servicesApi.services)[index];
                              return ListTile(
                                dense: true,
                                title: Text(services.workName),
                                trailing: Icon(Icons.arrow_forward),
                                onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OrderScreen()));},
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(),
                          ),
                        ),
                        Container(
                          child: Column(

                          )
                        ),
                      ],
                    ),
                  )
                )
              :
                Center(child: CircularProgressIndicator(),);
          }
        ),
      ),
    );
  }
}
