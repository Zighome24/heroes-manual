import 'package:flutter/material.dart';

class Screening extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Screening")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Will Will be a list of things to look for in a potential victim of family violence.',
              style: new TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20
              )
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Sign 1'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Sign 2'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Sign 3'),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}