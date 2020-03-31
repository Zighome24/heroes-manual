import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class TipsToSeparate extends StatelessWidget {
  static const String route = '/tips_to_separate';
  static const List<String> screening_tips = [
    "This is the first example tip. It's a little longer so we can properly"
        "test out the length of a tip, how it looks when it is longer, "
        "and whether the font size, color, and contrast are all appropriate.",
    "This is the second example tip. Like two peas in a pod.",
    "This is the third example tip. All good things come in threes.",
    "This is the fourth example tip. May the fourth be with you.",
    "This is the fifth example tip. Probably better than Fifth Harmony's "
        "new song.",
    "This is the sixth example tip. In the sixth grade, social studies was"
        " my favorite subject.",
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
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    // may need to switch order of these children as render
                    // order of stacks affects click-ability
                    Center(
                      child: Text(
                        'Tips to Separate Victim and Perpetrator',
                        style: TextStyle(color: purple.shade500, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
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
                    itemCount: screening_tips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        //decoration: BoxDecoration(
                        //    color: background.shade600
                        //),
                        child: Text(
                          screening_tips[index],
                          style:
                          TextStyle(color: purple.shade600, fontSize: 20),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index)
                    => Divider(
                      color: background.shade600,
                      thickness: 3.0,
                    ),
                  ),
                ),
              ),
              /*Container(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Sources',
                  style: TextStyle(color: purple.shade500, fontSize: 20),
                ),
              ),*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}
