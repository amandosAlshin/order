import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:order/stores/branchs_store.dart';
import 'ServiceChange.dart';
class BranchsList extends StatefulWidget {
  final int id;
  final String name;
  final String description;
  final String logo;
  const BranchsList({Key key, @required this.id, @required this.name, @required this.description, @required this.logo}) : super(key: key);

  @override
  _BranchsListState createState() => _BranchsListState();
}

class _BranchsListState extends State<BranchsList> {
  BranchsStore  branchsStore;
  @override
  void initState() {
    super.initState();
    branchsStore = BranchsStore();
    branchsStore.fetchBranchList(widget.id.toString());
  }
  Widget _branchBuildItem(BuildContext context, BranchsStore branchsStore, index){
    return GestureDetector(
      onTap: () { Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ServiceChange(id: 0,)));},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(branchsStore.branchsApi.branchs[index].name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.grey[900]),),
                  SizedBox(height: 12,),
                  Text(branchsStore.branchsApi.branchs[index].city+", "+branchsStore.branchsApi.branchs[index].adress, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey[500]),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Builder(
                          builder: (context){
                            if(branchsStore.branchsApi.branchs[index].state > 0){
                              return Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.fiber_manual_record, color: Colors.green, size: 14,),
                                    Text("Открыто", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[500]),),
                                  ],
                                ),
                              );
                            }else{
                              return Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.fiber_manual_record, color: Colors.red, size: 14,),
                                    Text("Закрыто", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey[500]),),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(width: 12,),
                        Icon(Icons.people, color: Colors.grey[500],size: 14,),
                        Text(branchsStore.branchsApi.branchs[index].waiting, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[500]),),
                      ],
                    ),
                  )

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      appBar: AppBar(
        title: Text("Отделений"),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16,),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 2),
                  title: Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w700),),
                  subtitle: Text(widget.description, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12, color: Colors.blue[100]),),
                ),
              ),
            ],
          ),
          DraggableScrollableSheet(
            builder: (context, scrollControlleer){
              return Observer(
                  name: "Branchs List",
                  builder: (BuildContext context) {
                    return (branchsStore.branchsApi != null )
                        ?
                          Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(243, 245, 248, 1),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 24,),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Отделений", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),),
                                        ],
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 32),
                                    ),
                                    SizedBox(height: 16,),
                                    ListView.builder(
                                        itemBuilder:(BuildContext context, int index) {
                                          return _branchBuildItem(context, branchsStore, index);
                                        },
                                        itemCount: branchsStore.branchsApi.branchs.length,
                                        shrinkWrap: true,
                                        padding: EdgeInsets.all(0),
                                        controller: ScrollController(keepScrollOffset: false)
                                    ),
                                  ],
                                ),
                                controller: scrollControlleer,
                              )
                          )
                      :
                          Center(child: CircularProgressIndicator(),);
                }
              );
            },
            initialChildSize: 0.85,
            minChildSize: 0.85,
            maxChildSize: 1,
          )
        ],
      ),
    );
  }
}
