import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/lesson/lesson.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class LessonStart extends StatefulWidget {

  static const String route = '/lesson_start';

  @override
  State<StatefulWidget> createState() => _LessonStartState();
}

class _LessonStartState extends State<LessonStart> {

  Lesson _lesson = Lesson.emptyLesson;

  @override
  Widget build(BuildContext context) {
    final String lessonName = ModalRoute.of(context).settings.arguments;

    Lesson.localLessonFactory(lessonName).then((value)
      {
        setState(() { _lesson = value; });
      }
    );

    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
        showTrailing: true,
        trailingAction: null,
        title: lessonName,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: _lesson == Lesson.emptyLesson ?
          // Un-comment this and remove Container()
          /* Loading(
              indicator: LineScaleIndicator(),
              size: 50.0,
              color: purple.shade500
          ) */ Container() : Column(
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
  //            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(30.0),
                child: new Text(
                    lessonName,
                    style: new TextStyle(fontSize: 30)

                ),

              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: new Text(
                  _lesson.summary,
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, LessonPage.route, arguments: _lesson);
                },
                child: new Text('Start the Lesson!', textAlign: TextAlign.center),

              ),
            ],
          ),
      ),
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}