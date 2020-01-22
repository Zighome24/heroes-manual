import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class About extends StatelessWidget {
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
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text('To Be Included: information about the application, team'
                  + ' and bibliographical sources',
              style: new TextStyle(color: Colors.black, fontSize: 17))
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
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}