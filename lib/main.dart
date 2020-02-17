import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/about.dart';
import 'package:heroes_manual/pages/exampleQuizQuestion.dart';
import 'package:heroes_manual/pages/lesson/lesson.dart';
import 'package:heroes_manual/pages/main_menu.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/quiz_start.dart';
import 'package:heroes_manual/pages/lesson/lesson_start.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/organizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heroes Manual',
      theme: ThemeData(
        primarySwatch: accent,
        accentColor: purple.shade500,
      ),
      initialRoute: '/',
      routes: {
        // All of the navigation routes for the app will go here.
        '/' : (context) => MainMenu(),
        Screening.route : (context) => Screening(),
        QuizStart.route : (context) => QuizStart(),
        LessonStart.route : (context) => LessonStart(),
        About.route : (context) => About(),
        Screening.route : (context) => Screening(),
        PerpetratorPresent.route : (context) => PerpetratorPresent(),
        ExampleQuizQuestion.route : (context) => ExampleQuizQuestion(),
        Hotlines.route : (context) => Hotlines(),
        Organizations.route : (context) => Organizations(),
        LessonPage.route : (context) => LessonPage(),
      },
    );
  }
}
