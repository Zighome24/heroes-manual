import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/pages/training/training.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';


class TrainingStart extends StatefulWidget {

  static const String route = '/training_start';

  @override
  State<StatefulWidget> createState() => _TrainingStartState();
}

class _TrainingStartState extends State<TrainingStart> {

  Training _training = Training.emptyTraining;

  @override
  Widget build(BuildContext context) {
    final String trainingName = ModalRoute.of(context).settings.arguments;

    Training.localTrainingFactory(trainingName).then((value)
      {
        setState(() { _training = value; });
      }
    );

    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
        showTrailing: false,
        title: trainingName,
      ),
      body: Center(
        child: _training == Training.emptyTraining ?
          // Un-comment this and remove Container()
          /* Loading(
              indicator: LineScaleIndicator(),
              size: 50.0,
              color: purple.shade500
          ) */ Container() : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: new Text(
                    trainingName,
                    style: new TextStyle(fontSize: 30, color: purple.shade600)
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: new Text(
                  _training.summary,
                  textAlign: TextAlign.center,
                  style: new TextStyle(color: purple.shade600)
                ),
              ),
              Container(
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
                    Navigator.pushNamed(context, TrainingPage.route, arguments: _training);
                  },
                  child: new Text(
                      'Start the Training!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
              ),
            ],
          ),
      ),
      bottomNavigationBar: HMBottomNavBar()
    );
  }
}