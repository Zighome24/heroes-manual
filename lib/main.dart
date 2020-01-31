import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/about.dart';
import 'package:heroes_manual/pages/main_menu.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/quiz_start.dart';
import 'package:heroes_manual/pages/lesson_start.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/hotlines.dart';

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
        '/' : (context) => MainMenu(),
        '/quiz_start' : (context) => QuizStart(),
        '/lesson_start' : (context) => LessonStart(),
        '/about' : (context) => About(),
        '/screening_page' : (context) => Screening(),
        '/perpetrator_present' : (context) => PerpetratorPresent(),
        '/hotlines' : (context) => Hotlines(),
      },
    );
  }
}
