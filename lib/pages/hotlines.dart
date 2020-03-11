import 'package:flutter/cupertino.dart';
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
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
              child: Text(
                'Important hotlines.',
                style: new TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 20
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                    onPressed: () => launch("tel://6789564895"),
                    child: SizedBox(
                      width: double.infinity,
                      child: new Text(
                        "This is Alex's phone #",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                    onPressed: () => launch("tel://6789564895"),
                    child: SizedBox(
                      width: double.infinity,
                      child: new Text(
                          "didn't want to accidentally call a hotline"
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: new FlatButton(
                    onPressed: () => launch("tel://6789564895"),
                    child: SizedBox(
                      width: double.infinity,
                      child: new Text(
                          "Call Alex"
                      ),
                    ),
                  ),
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