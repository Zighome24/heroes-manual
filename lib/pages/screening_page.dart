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
              Text('Will be a list of things to look for in a potential'
               + 'victim of family violence.')
            ],
          )
      ),
    );
  }
}