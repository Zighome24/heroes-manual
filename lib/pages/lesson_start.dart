import 'package:flutter/material.dart';

class LessonStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Lesson"),
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
                  'This lesson is meant to teach you about'
                      + 'the economic impacts of Domestic Violence '
                      + 'across families and individuals across the '
                      + 'United States. If you would like to quiz yourself '
                      + 'on the material covered in this lesson, checkout the '
                      + 'Economic Impact Quiz in the Quiz section of the app',
                  textAlign: TextAlign.center,
                ),
              ),
              RaisedButton(
                onPressed: null,
                child: new Text('Start the Lesson', textAlign: TextAlign.center,),
              ),
            ],
          ),
        )
    );
  }
}