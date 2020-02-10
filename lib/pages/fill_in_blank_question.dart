import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';

//when you do Navigator.pop(), return the boolean of the question result
//TODO: have source (question content source) navigation button
// "ValueChanged" callback may be useful to pass data between widgets in same screen

class FillInBlankQuestion extends StatefulWidget {
  final Question question;
  final Function correctFunction;
  final Function incorrectFunction;

  const FillInBlankQuestion({
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
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.question.text),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(border: InputBorder.none,
                  hintText: 'type your answer here'),
            controller: textEditingController,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: _submission(textEditingController.toString()),
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
