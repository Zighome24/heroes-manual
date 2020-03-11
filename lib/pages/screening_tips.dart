import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class ScreeningTips extends StatelessWidget {
  static const String route = '/screening_tips';
  static const List<String> screening_tips = [
    "This is the first example tip.",
    "This is the second example tip.",
    "This is the third example tip.",
    "This is the fourth example tip.",
    "This is the fifth example tip.",
    "This is the sixth example tip.",
    "This is the seventh example tip.",
    "This is the eighth example tip.",
    "This is the ninth example tip.",
    "This is the tenth example tip.",
    "This is the eleventh example tip."
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
        child: ClipRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(30.0),
                alignment: Alignment.topCenter,
                child: Text(
                  'ScreeningTips',
                  style: TextStyle(color: purple.shade500, fontSize: 30),
                ),
              ),
              ClipRect(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: screening_tips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          screening_tips[index],
                          style:
                              TextStyle(color: purple.shade500, fontSize: 20),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(30.0),
                  child: Text('Sources',
                      style:
                          new TextStyle(color: purple.shade500, fontSize: 20))),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}