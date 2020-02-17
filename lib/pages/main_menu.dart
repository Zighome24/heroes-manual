import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
            child: Text('Quiz Me!')
        ),
        RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, LessonStart.route);
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
             Navigator.pushNamed(context, Hotlines.route);
           },
           child: Text('Hotlines'),
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
                Navigator.pushNamed(context, Organizations.route);
              },
              child: Text('Organizations'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('About'),
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
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }
}