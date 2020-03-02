import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/widgets/fill_in_blank_question.dart';
import 'package:heroes_manual/widgets/multiple_choice_question.dart';

class QuizPage extends StatefulWidget {
  static const String route = '/quiz';

  @override
  State createState() => _QuizState();
}

class _QuizState extends State<QuizPage> {
  int _question = 0;

  List<bool> _answers = List();

  showOverlay(BuildContext context, Quiz quiz, bool correct) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Text(
                        correct ? "Correct!" : "Incorrect.",
                        style: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Text(
                          correct ? "Well done!"
                              : quiz.questions[_question].informativeMessage,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: purple.shade500),
                          softWrap: true,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: RaisedButton(
                        child: (_question) < quiz.questions.length ?
                          Text("Next Question") : Text("Finish Quiz"),
                        onPressed: () => setState(() {
                          _answers.add(correct);
                          _question++;
                          overlayEntry.remove();
                        })
                      ),
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

  @override
  Widget build(BuildContext context) {
    final Quiz _quiz = ModalRoute.of(context).settings.arguments as Quiz;

    Widget question = Container();
    if (_question < _quiz.questions.length) {
      switch (_quiz.questions[_question].type) {
        case "f":
          question = FillInBlankQuestion(
              question: _quiz.questions[_question],
              correctFunction: () => showOverlay(context, _quiz, true),
              incorrectFunction: () => showOverlay(context, _quiz, false));
          break;
        case "mc":
          question = MultipleChoiceQuestion(
              question: _quiz.questions[_question],
              correctFunction: () => showOverlay(context, _quiz, true),
              incorrectFunction: () => showOverlay(context, _quiz, false));
          break;
        default:
          throw Exception("Attempted loading of question with unknown type: " +
              _quiz.questions[_question].type +
              " -- For quiz: " +
              _quiz.title);
      }
    }

    return Scaffold(
        appBar: HMAppBar(
          showLeading: true,
          leadingAction: () => Navigator.pop(context),
          showTrailing: true,
          trailingAction: null,
          title: _quiz.title,
        ),
        body: (_question) < _quiz.questions.length ? Center(
          child: question,
        ) : Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Flexible(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Your score:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${_answers.fold(0, (count, answer) => answer ? count + 1 : count)} / ${_answers.length}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
              ),
              Spacer(),
              Flexible(
                  child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: 15.0,
                      runSpacing: 5.0,
                      children: <Widget>[
                        (_answers.fold(0, (count, answer) => answer ? count + 1 : count) != _answers.length) ? MaterialButton(
                            onPressed: () {
                              //remove correct questions
                              for (var i = 0; i < _answers.length; i++) {
                                if (_answers[i]) {
                                  _quiz.questions.removeAt(i);
                                }
                              }
                              _quiz.questions.shuffle();
                              //set _question to 0
                              setState(() {
                                _answers = [];
                                _question = 0;
                              });
                            },
                            color: purple.shade500,
                            child: Text(
                                "Retry Missed Questions",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                )
                            )
                        ) : Container(),
                        MaterialButton(
                            onPressed: () {
                              _quiz.questions.shuffle();
                              setState(() {
                                _question = 0;
                                _answers = [];
                              });
                            },
                            color: purple.shade500,
                            child: Text(
                                "Retake the Quiz",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                )
                            )
                        ),
                        MaterialButton(
                            onPressed: () { debugPrint("Navigate to Lesson"); },
                            color: purple.shade500,
                            child: Text(
                                "Return to training",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16
                                )
                            )
                        )
                      ]
                  )
              ),
              Spacer()
            ],
          ),
        ),
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}