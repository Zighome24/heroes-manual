import 'package:heroes_manual/data/data.dart';
import 'package:flutter/material.dart';

//TODO: add source (question content source) navigation button
// "ValueChanged" callback may be useful to pass data between widgets in same screen

class MultipleChoiceQuestion extends StatefulWidget {
  final Question question;

  //TODO: types of functions below may need to be VoidCallback
  //TODO: do the two functions below need to take in Strings? For example? For actual production?
  final Function(String) correctFunction;
  final Function(String) incorrectFunction;

  MultipleChoiceQuestion({
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

  @override
  _MultipleChoiceState createState() => new _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoiceQuestion> {
  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.question.text),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'type your answer here'
                      ),
                      controller: textEditingController,
                    ),
                    RaisedButton(
                      child: Text(
                          'Submit'
                      ),
                      onPressed: () => _validate(textEditingController.toString()),
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _validate(String e) {
    //need to validate the submitted answer
    print(textEditingController.text);
    textEditingController.clear();
    if (e.compareTo(widget.question.answer) == 0) {
      widget.correctFunction(e);
    } else {
      widget.incorrectFunction(e);
    }
    //TODO: should this functions be returned or somehow invoked?
  }
}
