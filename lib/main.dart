import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/main_menu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes Manual',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
//        primarySwatch: Colors.white38,
//        accentColor: Colors.deepPurple,
//        backgroundColor: Color.fromRGBO(244, 244, 244, 1.0)
      ),
      initialRoute: '/',
      routes: {
        // All of the navigation routes for the app will go here.
        '/' : (context) => MainMenu()
      },
    );
  }
}
