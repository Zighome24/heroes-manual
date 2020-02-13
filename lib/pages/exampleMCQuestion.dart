import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/fill_in_blank_question.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/widgets/multiple_choice_question.dart';


class ExampleMCQuizQuestion extends StatelessWidget {
  static const String route = '/example_mc_quiz_question';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: MultipleChoiceQuestion(
                question: Question.fromJson({
                  'text':  'Is this an example question?',
                  'type': 'multiple_choice',
                  'answer':
                  [
                    'this is the correct answer',
                    'this is an incorrect answer',
                    'this is another incorrect answer',
                    'this is the last incorrect answer']
                }), correctFunction: print,
                incorrectFunction: print
            ),
          )
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}