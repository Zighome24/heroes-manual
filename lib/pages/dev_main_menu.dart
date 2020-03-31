import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/pages/training/training_start.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/laws.dart';
import 'package:heroes_manual/pages/main_menu.dart';

class DevMainMenu extends StatelessWidget {
  static const String route = '/dev_main_menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Heroes\' Manual',
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Screening.route);
              },
              child: Text('Screening Page'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, PerpetratorPresent.route);
              },
              child: Text('Perpetrator Present?'),
            ),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizStart.route, arguments: "Economic Impact");
                },
                child: Text('Quiz')
            ),
            /*RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, About.route);
              },
              child: Text('About'),
            ),*/
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Hotlines.route);
              },
              child: Text('Hotlines'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Laws.route);
              },
              child: Text('Laws'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Organizations.route);
              },
              child: Text('Organizations'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, TrainingStart.route, arguments: "Economic Impact");
              },
              child: Text('Start the Lesson'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, MainMenu.route);
              },
              child: Text('Main Menu'),
            )
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }
}