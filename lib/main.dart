import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/matrix/matrix.dart';
import 'package:heroes_manual/pages/matrix/stakeholder_info.dart';
import 'package:heroes_manual/pages/safety_plan.dart';
import 'package:heroes_manual/pages/tips_to_separate.dart';
import 'package:heroes_manual/pages/not_separate_screening.dart';
import 'package:heroes_manual/pages/training/training.dart';
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
import 'package:heroes_manual/pages/general_tips_to_separate.dart';
import 'package:heroes_manual/pages/red_flags.dart';


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
        Screening.route : (context) => Screening(),
        QuizStart.route : (context) => QuizStart(),
        TrainingStart.route : (context) => TrainingStart(),
        TipsToSeparate.route: (context) => TipsToSeparate(),
        Screening.route : (context) => Screening(),
        NotSeparateScreening.route : (context) => NotSeparateScreening(),
        PerpetratorPresent.route : (context) => PerpetratorPresent(),
        Hotlines.route : (context) => Hotlines(),
        Organizations.route : (context) => Organizations(),
        TrainingPage.route : (context) => TrainingPage(),
        RedFlags.route : (context) => RedFlags(),
        QuizPage.route : (context) => QuizPage(),
        Laws.route : (context) => Laws(),
        General_Tips_To_Separate.route : (context) => General_Tips_To_Separate(),
        SafetyPlan.route : (context) => SafetyPlan(),
        MatrixPage.route : (context) => MatrixPage(),
        StakeholderInfoPage.route : (context) => StakeholderInfoPage(),
      },
    );
  }
}
