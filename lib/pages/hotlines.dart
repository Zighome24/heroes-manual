import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotlines extends StatelessWidget {
  static const String route = '/hotlines';

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
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("This is Alex's phone #")),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("Just didn't want to accidentally call a real hotline")),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                      onPressed: () => launch("tel://6789564895"),
                      child: new Text("Call Alex")),
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