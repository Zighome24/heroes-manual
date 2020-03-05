import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class About extends StatelessWidget {
  static const String route = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(30.0),
                child: Text('Our project, Heroes\' Manual, aims to serve as a quick, '
                    + 'intuitive guide that law enforcement officers and other '
                    + 'service providers can use for resources and instruction '
                    + 'on handling domestic violence situations.',
                    //  or some standardized/uniform font style for the app
                    style: new TextStyle(color: purple.shade500, fontSize: 20))
            ),
            Container(
                padding: const EdgeInsets.all(30.0),
                child: Text('Junior Design Team 9317: Alex Levine, Sophie Marcus'
                    + ', Sirila Padi, Paula Ruiz, Justin Ziegler',
                    style: new TextStyle(color: purple.shade500, fontSize: 20))
            ),
            Container(
                padding: const EdgeInsets.all(30.0),
                child: Text('Sources',
                    style: new TextStyle(color: purple.shade500, fontSize: 20))
            ),
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}