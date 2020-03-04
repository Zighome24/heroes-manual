import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/lesson/lesson.dart';
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
        showTrailing: false,
        title: lessonName,
      ),
      body: Center(
        child: _lesson == Lesson.emptyLesson ?
          // Un-comment this and remove Container()
          /* Loading(
              indicator: LineScaleIndicator(),
              size: 50.0,
              color: purple.shade500
          ) */ Container() : Column(
            mainAxisAlignment: MainAxisAlignment.center,
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