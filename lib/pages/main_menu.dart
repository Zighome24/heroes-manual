import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/pages/organizations.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/pages/lesson/lesson_start.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/about.dart';
import 'package:heroes_manual/pages/screening_page.dart';
import 'package:heroes_manual/pages/hotlines.dart';
import 'package:heroes_manual/pages/laws.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
        showLeading: true,
        leadingAction: () => showOverlay(context),
        leadingIcon: Icons.info_outline,
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
                Navigator.pushNamed(context, LessonStart.route, arguments: "Economic Impact");
              },
              child: Text('Start the Lesson'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }

  showOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry =
//    return Overlay.of(context).insert(
      OverlayEntry(
        builder: (context) => Material(
          type: MaterialType.transparency,
          child: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.grey.withOpacity(0.6),
            child: Padding(
              padding: EdgeInsets.only(top: 85.0, bottom: 65.0, right: 15.0, left: 15.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                            onPressed: () => overlayEntry.remove(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: purple.shade500,
                              ),
                              iconSize: 28,
                            ),
                            Spacer()
                          ]
                        )
                      ),
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: SingleChildScrollView(
                            child: Text('Created by Team Helping Our Heroes, whose members '
                              + 'are students of the Georgia Institute of Technology, our '
                              + 'project, Heroes\' Manual, aims to serve as a quick, '
                              + 'intuitive guide that law enforcement officers and other '
                              + 'service providers can use for resources and instruction '
                              + 'on handling domestic violence situations.',
                              //TODO: change the source of the purple color and style to main
                              //  or some standardized/uniform font style for the app
                              style: new TextStyle(color: purple.shade500, fontSize: 20),
                              textAlign: TextAlign.center,
                            )
                          ),
                        )
                      )
                    ]
                  )
                )
              )
            )
          )
        )
      );
    overlayState.insert(overlayEntry);
  }
}