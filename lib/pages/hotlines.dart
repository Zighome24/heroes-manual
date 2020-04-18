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
    "tel://8007997233",
    "tel://8006564673",
    "tel://3038391852",
    "tel://8003342836",
  ];
  static const List<String> hotlineTitles = [
    "National Domestic Violence",
    "National Sexual Assault",
    "National Coalition Against DV",
    "Georgia Statewide Domestic Violence",
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
                        'Important Hotlines',
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
            Expanded(
              child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListView.builder(
                        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        shrinkWrap: true,
                        itemCount: hotlineNumbers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20.0),
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
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
            )
          ],
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}
