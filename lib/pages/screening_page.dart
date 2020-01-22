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
            children: <Widget>[
              Container(
                style: new TextStyle(color: Colors.deepPurpleAccent, fontSize: 20))
                Text('Will be a list of things to look for in a potential'
                    + 'victim of family violence.')
              )
              ListView(
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
              )
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('<'),
              )
            ],
          )
      ),
    );
  }
}