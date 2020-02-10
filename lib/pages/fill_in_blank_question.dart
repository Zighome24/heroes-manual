import 'package:flutter/material.dart';

//TODO: merge hm49 into my branch
//TODO: could merge sprint_2 into my branch each time I work
//when you do Navigator.pop(), return the boolean of the question result
//TODO: make submit button
//TODO: have source (question content source) navigation button

class FillInBlankQuestion extends StatefulWidget {
  //TODO: expect question as input to this thing - that'll be the question I'll want to render
  //TODO: also expect two functions - incorrect and correct - as inputs (like leading and trailing functions of HMAppBar)

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
