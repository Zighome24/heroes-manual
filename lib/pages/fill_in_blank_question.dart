import 'package:flutter/material.dart';

class FillInBlankQuestion extends StatefulWidget {
  FillInBlankQuestion() : super();

  @override
  MyFillInBlank createState() => new MyFillInBlank();
}

class MyFillInBlank extends State<FillInBlankQuestion> {
  final TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Question question question question'),
            TextField(decoration: InputDecoration(border: InputBorder.none,
                hintText: 'type your answer here'),
            onSubmitted: _submission,
            controller: textEditingController,)
          ],
        )
      )
    );
  }

  void _submission(String e) {
    //need to validate the submitted answer
    print(textEditingController.text);
    textEditingController.clear();
  }
}