import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/fill_in_blank_question.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';


class ExampleQuizQuestion extends StatelessWidget {
  static const String route = '/example_quiz_question';
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
            child: FillInBlankQuestion(
                question: Question.fromJson({
                  'text':  'Is this an example question?',
                  'type': 'fill_in_blank',
                  'answer': 'this is the correct answer'
                }), correctFunction: print,
                incorrectFunction: print
            ),
          )
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}