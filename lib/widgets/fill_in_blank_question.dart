import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/utility/colors.dart';

//TODO: add source (question content source) navigation button
// "ValueChanged" callback may be useful to pass data between widgets in same screen

class FillInBlankQuestion extends StatelessWidget {
  final Question question;

  //TODO: types of functions below may need to be VoidCallback
  //TODO: do the two functions below need to take in Strings? For example? For actual production?
  final Function correctFunction;
  final Function incorrectFunction;

  FillInBlankQuestion({
    Key key,
    @required this.question,
    @required this.correctFunction,
    @required this.incorrectFunction,
    IconData correctIcon = Icons.check,
    IconData incorrectIcon = Icons.not_interested,
    bool correct,
  }) : super(
    key: key,
  );

  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 2,
                child: SingleChildScrollView(
                    child: Text(
                        question.text,
                        style: TextStyle(
                            color: purple.shade500,
                            fontSize: 20.0
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center
                    )
                )
            ),
            Spacer(),
            Flexible(
              flex: 2,
                child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Type your answer here'
                        ),
                        controller: textEditingController,
                      ),
                      RaisedButton(
                        child: Text(
                            'Submit'
                        ),
                        onPressed: () => _validate(textEditingController.text),
                      )
                    ]
                )
            )
          ]
      )
    );
  }

  void _validate(String e) {
    //need to validate the submitted answer
    textEditingController.clear();
    if (e == question.correct) {
      correctFunction();
    } else {
      incorrectFunction();
    }
  }
}
