import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Hotlines extends StatelessWidget {
  static const String route = '/hotlines';
  static const List<String> hotlineNumbers = [
    "tel://6789564895",
    "tel://6789564895",
    "tel://6789564895"
  ];
  static const List<String> hotlineTitles = [
    "This is Alex's phone #",
    "not an actual hotline",
    "Call Alex"
  ];

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
                'Important Hotlines',
                style:
                new TextStyle(color: Colors.deepPurpleAccent, fontSize: 20),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
                    shrinkWrap: true,
                    itemCount: hotlineNumbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () => launch(hotlineNumbers[index]),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.phone),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    hotlineTitles[index],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                            height: 10,
                            thickness: 10,
                            color: background,
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
