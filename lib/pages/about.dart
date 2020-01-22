import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              //TODO: standardize edge insets throughout project
              padding: const EdgeInsets.all(30.0),
              child: Text('Created by Team Helping Our Heroes, whose members '
                  + 'are students of the Georgia Institute of Technology, our '
                  + 'project, Heroes\' Manual, aims to serve as a quick, '
                  + 'intuitive guide that law enforcement officers and other '
                  + 'service providers can use for resources and instruction '
                  + 'on handling domestic violence situations.',
                //TODO: change the source of the purple color and style to main
                  //  or some standardized/uniform font style for the app
                style: new TextStyle(color: Colors.deepPurpleAccent, fontSize: 20))
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context); //return to previous screen
              },
              child: Text('<'),
            ),
          ],
        ),
      ),
    );
  }
}