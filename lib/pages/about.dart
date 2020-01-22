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
            Text('App created by Team Helping Our Heroes whose members are '
            + 'students of the Georgia Institute of Technology.'),
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