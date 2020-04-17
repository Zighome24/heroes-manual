import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/pages/tips_to_separate.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/pages/not_separate_screening.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/screening_page.dart';

class PerpetratorPresent extends StatelessWidget {
  static const String route = '/perpetrator_present';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        showTrailing: true,
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
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
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Text('Are the perpetrator and victim separate?',
                  style: TextStyle(fontSize: 25, color: purple.shade500),
                  textAlign: TextAlign.center,
              ),
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                    gradient: LinearGradient(
                        colors: [purple.shade600, Colors.deepPurple[400]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Screening.route);
                    },
                    padding: EdgeInsets.all(0.0),
                    child: new Text(
                      'Yes',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                    gradient: LinearGradient(
                        colors: [purple.shade600, Colors.deepPurple[400]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),
                  child: new FlatButton(
                    child: Text(
                      'Tips to Separate',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, TipsToSeparate.route);
                    },
                  ),
                ),
              ]
            ),
            ButtonBar(
              mainAxisSize: MainAxisSize.min,
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(6.0),
                    ),
                    gradient: LinearGradient(
                        colors: [purple.shade600, Colors.deepPurple[400]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),
                  child: new FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, NotSeparateScreening.route);
                    },
                    padding: EdgeInsets.all(0.0),
                    child: new Text(
                      'Cannot Separate',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isScreeningSelected: true),
    );
  }
}
