import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotlines extends StatelessWidget {
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
                'Important hotlines.',
                style: new TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 20
                )
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  // i have no idea if this works because
                  // my emulator still isn't running:(
                  // should work according to stack overflow
                  // i used my phone number so i could test eventually
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("Call me")),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("Call me")),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("Call me")),
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