import 'package:heroes_manual/data/data.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';

//TODO: add source (question content source) navigation button
// "ValueChanged" callback may be useful to pass data between widgets in same screen

class MultipleChoiceQuestion extends StatelessWidget {
  final Question question;

  //TODO: types of functions below may need to be VoidCallback
  //TODO: do the two functions below need to take in Strings? For example? For actual production?
  final Function correctFunction;
  final Function incorrectFunction;

  MultipleChoiceQuestion({
    Key key,
    @required this.question,
    @required this.correctFunction,
    @required this.incorrectFunction,
    IconData correctIcon = Icons.check,
    IconData incorrectIcon = Icons.not_interested,
    bool correct,
  });

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
            flex: 8,
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
            flex: 12,
              child: Align(
                alignment: Alignment.bottomCenter,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: question.options.length,
                      itemBuilder: (_, index) =>
                          Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Container(
                                padding: EdgeInsets.all(0.0),
                                decoration: BoxDecoration(
                                  borderRadius: new BorderRadius.all(
                                    const Radius.circular(6.0),
                                  ),
                                  gradient: LinearGradient(
                                      colors: [purple.shade600, Colors.deepPurple[400]],
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft
                                  ),
                                ),
                                child: FlatButton(
                                  onPressed: question.options[index] == question.correct ?
                                  correctFunction : incorrectFunction,
                                  child: Text(question.options[index], style: TextStyle(color: Colors.white),),
                                ),
                              )
                          )
                  )
              )

          ),
          Spacer()
        ],
      ),
    );
  }
}
