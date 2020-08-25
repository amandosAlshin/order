import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'CategoryList.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String formattedDate = DateFormat('EEEE, d.MM.y','ru').format(DateTime.now());
  String formattedTime = DateFormat('kk : mm','ru').format(DateTime.now());

  @override

  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Text(formattedTime, style: TextStyle(color: Colors.white70, fontSize: 45, fontWeight: FontWeight.bold),),
                Text(formattedDate, style: TextStyle(color: Colors.white, fontSize: 16,),),
                SizedBox(height: 20,)
              ],
            ),
          ),
          DraggableScrollableSheet(
            builder: (context, scrollController){
              return Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 245, 248, 1),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Обьекты", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.black),),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        CategoryList(),
                      ],
                    ),
                    controller: scrollController,
                  )
              );
            },
            initialChildSize: 0.75,
            minChildSize: 0.75,
            maxChildSize: 1,
          )
        ],
      ),
    );
  }
}
