import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';


class QuizStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HMAppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          showLeading: true,
          showTrailing: true,
          leadingAction: () => Navigator.pop(context),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
//            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(30.0),
                child: new Text(
                  'Economic Impact',
                  style: new TextStyle(fontSize: 30)

                ),

              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                child: new Text(
                  'This quiz is meant to test your knowledge '
                  + 'on the economic impacts of domestic violence '
                  + 'across families and individuals across the '
                  + 'United States. You can prepare for the quiz '
                  + 'by studying the Economic Impact lesson in '
                  + 'the lessons section of the application.',
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: null,
                child: new Text('Take me to the quiz!', textAlign: TextAlign.center,),
              ),
              RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/questionTestPage');
                  },
                  child: Text('Question Test Page')
              ),
            ],
          ),
        ),
        bottomNavigationBar: HMBottomNavBar(),
    );
  }
}