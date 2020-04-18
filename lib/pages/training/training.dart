import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class TrainingPage extends StatefulWidget {
  static const String route = '/training';

  @override
  State createState() => _TrainingState();
}

class _TrainingState extends State<TrainingPage> {

  static const double iconSize = 32;

  int _card = 0;

  @override
  Widget build(BuildContext context) {
    final Training _training = ModalRoute.of(context).settings.arguments as Training;

    return Scaffold(
        appBar: HMAppBar(
          showLeading: true,
          leadingAction: () => Navigator.pop(context),
          showTrailing: false,
          trailingAction: null, // put source navigation here
          title: _training.title,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: _card == 0 ? Container() : MaterialButton(
                        onPressed: () {
                          setState(() {
                            _card--;
                          });
                        },
                        highlightColor: Colors.white,
                        child: SizedBox.expand(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: purple.shade500,
                          )
                        )
                      )
                    )
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 30, bottom: 30),
                              child: SingleChildScrollView(
                                child: Text(
                                  _training.cards[_card].text,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: purple.shade700
                                  )
                                )
                              )
                            )
                          )
                        ),
                        Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                                "${_card + 1}/${_training.cards.length}",
                                style: TextStyle(
                                    fontSize: 28.0,
                                    color: purple.shade500,
                                    fontWeight: FontWeight.bold
                                )
                            )
                        )
                      ]
                    )
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(
                      child: _card == (_training.cards.length - 1) ? Container() : MaterialButton(
                        onPressed: () {
                          setState(() {
                            _card++;
                          });
                        },
                        highlightColor: Colors.white,
                        child: SizedBox.expand(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: purple.shade500,
                          )
                        )
                      )
                    )
                  )
                ]
              )
            ),
            (_card + 1) == _training.cards.length ? Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
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
                        onPressed: () { Navigator.popAndPushNamed(context, QuizStart.route, arguments: _training.title); },
                        child: Text(
                          "Quiz me!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Container(
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
                              onPressed: () {
                                setState(() {
                                  _training.cards.shuffle();
                                  _card = 0;
                                });
                              },
                              child: Text(
                                  "Restart!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16
                                  )
                              )
                          )
                      )
                  )
                ],
              )
            ) : Container()
          ]
        ),
        bottomNavigationBar: HMBottomNavBar()
    );
  }
}