import 'package:flutter/material.dart';

class FillInBlankQuestion extends StatefulWidget {
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
            onChanged: (text) {
              //validate the answer or pass on to another widget with that responsibility
            },
            controller: textEditingController,)
          ],
        )
      )j  
    );
  }
}