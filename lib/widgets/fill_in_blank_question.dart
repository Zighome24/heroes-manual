import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';

//TODO: add source (question content source) navigation button
// "ValueChanged" callback may be useful to pass data between widgets in same screen

class FillInBlankQuestion extends StatefulWidget {
  final Question question;

  //TODO: types of functions below may need to be VoidCallback
  //TODO: do the two functions below need to take in Strings? For example? For actual production?
  final Function(String) correctFunction;
  final Function(String) incorrectFunction;

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

  @override
  _FillInBlankState createState() => new _FillInBlankState();
}

class _FillInBlankState extends State<FillInBlankQuestion> {
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
                          onPressed: _submission(textEditingController.toString()),
                        )
                      ]
                  ),
                )
              ],
            )
        )
    );
  }

  Function _submission(String e) {
    //need to validate the submitted answer
    print(textEditingController.text);
    textEditingController.clear();
    if (e.compareTo(widget.question.answer) == 0) {
      return widget.correctFunction;
    } else {
      return widget.incorrectFunction;
    }
    //TODO: should this functions be returned or somehow invoked?
  }
}
