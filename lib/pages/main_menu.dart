import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/laws.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/quiz_start.dart';
import 'package:heroes_manual/pages/lesson/lesson_start.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/about.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/hotlines.dart';


class MainMenu extends StatelessWidget {

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
                  Navigator.pushNamed(context, QuizStart.route);
                },
                child: Text('Quiz')
            ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/lesson_start');
            },
            child: Text('Start the Lesson'),
          ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Laws.route);
              },
              child: Text('Laws'),
                Navigator.pushNamed(context, LessonStart.route);
                Navigator.pushNamed(context, '/lesson_start');
                Navigator.pushNamed(context, About.route);
              },
              child: Text('About'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Hotlines.route);
              },
              child: Text('Hotlines'),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, Organizations.route);
              },
              child: Text('Organizations'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, LessonStart.route, arguments: "Economic Impact");
              },
              child: Text('Start the Lesson'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, About.route);
              },
              child: Text('About'),
            ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/about');
            },
            child: Text('About'),
          ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }
}