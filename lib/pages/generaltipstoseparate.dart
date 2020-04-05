import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class GeneralTipsToSeparate extends StatelessWidget {
  static const String route = '/generaltipstoseparate';
  static const List<String> general_screening_tips = [
    "Remain non-judgemental and supportive.",
    "Make it clear that they are not alone.",
    "Stress the importance of getting help.",
    "Make it clear that there are resources.",
    "Speaking slowly, making it clear you are not in a rush.",
    "Avoid closed body language, such as crossed arms.",
    "Never refer to them as a victim in questioning, as this can have a negative"
        "connotation.",
    "Maintain eye contact and keep body language open.",
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
                        'General Tips to Separate',
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
                    itemCount: general_screening_tips.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        //decoration: BoxDecoration(
                        //    color: background.shade600
                        //),
                        child: Text(
                          general_screening_tips[index],
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