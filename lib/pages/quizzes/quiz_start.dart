import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/quizzes/quiz.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';


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
        Container() : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              child: new Text(
                  quizName,
                  style: new TextStyle(fontSize: 30, color: purple.shade600)
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Text(
                _quiz.summary,
                textAlign: TextAlign.center,
                style: new TextStyle(color: purple.shade600),
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
              child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, QuizPage.route, arguments: _quiz);
                },
                child: new Text(
                  'Start the Quiz!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}