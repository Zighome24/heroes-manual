import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/exampleMCQuestion.dart';
import 'package:heroes_manual/pages/exampleQuizQuestion.dart';
import 'package:heroes_manual/pages/training/training.dart';
import 'package:heroes_manual/pages/dev_main_menu.dart';
import 'package:heroes_manual/pages/main_menu.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/pages/training/training_start.dart';
import 'package:heroes_manual/pages/quizzes/quiz.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/laws.dart';

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
        MainMenu.route : (context) => MainMenu(),
        //TODO: remove dev main menu
        DevMainMenu.route : (context) => DevMainMenu(),
        Screening.route : (context) => Screening(),
        QuizStart.route : (context) => QuizStart(),
        TrainingStart.route : (context) => TrainingStart(),
        //About.route : (context) => About(),
        Screening.route : (context) => Screening(),
        PerpetratorPresent.route : (context) => PerpetratorPresent(),
        ExampleQuizQuestion.route : (context) => ExampleQuizQuestion(),
        ExampleMCQuizQuestion.route : (context) => ExampleMCQuizQuestion(),
        Hotlines.route : (context) => Hotlines(),
        Organizations.route : (context) => Organizations(),
        TrainingPage.route : (context) => TrainingPage(),
        QuizPage.route : (context) => QuizPage(),
        Laws.route : (context) => Laws(),
      },
    );
  }
}
