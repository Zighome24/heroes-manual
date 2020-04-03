import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/strings.dart';

class NotSeparateScreening extends StatelessWidget {
  static const String route = '/not_separate_screening';

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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment.center,
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Tips to Screen Victim When Perpetrator is Nearby',
                          style: TextStyle(color: purple.shade500, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: background.shade600,
                  thickness: 3.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              not_separate_screening_tips[index],
                              style: TextStyle(
                                color: purple.shade500,
                                fontSize: 20,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index)
                        => Divider(color: background.shade600, thickness: 3.0),
                        itemCount: not_separate_screening_tips.length),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: HMBottomNavBar(),
    );
  }
}