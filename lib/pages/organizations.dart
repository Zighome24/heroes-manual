import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class Organizations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
                'Will be a list of organizations',
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
                  title: Text('Organization 1'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Organization 2'),
                ),
                ListTile(
                  leading: Icon(Icons.label),
                  title: Text('Organization 3'),
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