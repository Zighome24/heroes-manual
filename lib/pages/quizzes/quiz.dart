import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
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

  correct() {
    debugPrint("correct");
  }

  incorrect() {
    debugPrint("incorrect");
  }

  @override
  Widget build(BuildContext context) {
    final Quiz _quiz = ModalRoute.of(context).settings.arguments as Quiz;

    Widget question;
    switch (_quiz.questions[_question].type) {
      case "f": question =
          FillInBlankQuestion(
            question: _quiz.questions[_question],
            correctFunction: correct,
            incorrectFunction: incorrect
          );
          break;
      case "mc": question =
          MultipleChoiceQuestion(
            question: _quiz.questions[_question],
            correctFunction: correct,
            incorrectFunction: incorrect
          );
          break;
      default:
        throw Exception(
            "Attempted loading of question with unknown type: " +
            _quiz.questions[_question].type + " -- For quiz: " + _quiz.title
        );
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
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}