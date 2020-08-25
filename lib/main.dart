import 'package:flutter/material.dart';
import 'widgets/HomeScreen.dart';
import 'widgets/ServiceChange.dart';
import 'package:intl/date_symbol_data_local.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nomad reserve',
      initialRoute: '/',
      routes: {
        '/': (context) => WalletApp(),
      },

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class WalletApp extends StatefulWidget{
  @override
  _WalletAppState createState() => _WalletAppState();
}

class _WalletAppState extends State<WalletApp>{
  var screens = [
    HomeScreen(),
    ServiceChange(),
  ]; //Screens for each tab
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting("ru");

    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 81, 158, 1),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Главная")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number),
              title: Text("Мои билеты")
          ),
          
        ],
        onTap: (index){
          setState(() {
            selectedTab = index;
          });
        },
        currentIndex: selectedTab,
        selectedItemColor: Colors.blue,
        showSelectedLabels: true,
        iconSize: 30,
      ),

      body: screens[selectedTab],
    );
  }
}