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
                          correct
                              ? "Well done!" : quiz.questions[_question].text, //TODO: update quiz to include lesson information in the quiz file
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
                        child: Text("Next Question"),
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

    Widget question;
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

    return Scaffold(
        appBar: HMAppBar(
          showLeading: true,
          leadingAction: () => Navigator.pop(context),
          showTrailing: true,
          trailingAction: null,
          title: _quiz.title,
        ),
        body: Center(
          child: question,
        ),
        bottomNavigationBar: HMBottomNavBar());
  }
}
