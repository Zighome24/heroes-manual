import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/quizzes/quiz.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';


class QuizStart extends StatefulWidget {
  static const String route = '/quiz_start';

  @override
  State<StatefulWidget> createState() => _QuizStartState();
}

class _QuizStartState extends State<QuizStart> {
  Quiz _quiz = Quiz.emptyQuiz;

  @override
  Widget build(BuildContext context) {
    final String quizName = ModalRoute.of(context).settings.arguments;

    Quiz.localQuizFactory(quizName).then((value)
    {
      setState(() { _quiz = value; });
    }
    );

    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
        showTrailing: false,
        title: quizName,
      ),
      body: Center(
        child: _quiz == Quiz.emptyQuiz ?
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
                  quizName,
                  style: new TextStyle(fontSize: 30)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: new Text(
                _quiz.summary,
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, QuizPage.route, arguments: _quiz);
              },
              child: new Text('Start the Quiz!', textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}