import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class Laws extends StatelessWidget {
  static const String route = '/laws';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
        trailingAction: () => debugPrint("something goes here, check task in Zenhub"),
      ),
      body: Center(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [purple.shade600, Colors.deepPurple[400]],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft
                        ),
                      ),
                      child: Text(
                        'Important Laws',
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Law 1'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Law 2'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Law 3'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}