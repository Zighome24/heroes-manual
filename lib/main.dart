import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/main_menu.dart';
import 'package:heroes_manual/utility/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes Manual',
      theme: ThemeData(
        primarySwatch: accent,
        accentColor: purple,
      ),
      initialRoute: '/',
      routes: {
        // All of the navigation routes for the app will go here.
        '/' : (context) => MainMenu()
      },
    );
  }
}
