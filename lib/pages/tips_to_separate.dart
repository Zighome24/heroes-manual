import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/strings.dart';

class TipsToSeparate extends StatelessWidget {
  static const String route = '/tips_to_separate';

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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                        colors: [purple.shade600, Colors.deepPurple[400]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Tips to Separate Victim and Perpetrator',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
//              Container(
//                padding: const EdgeInsets.all(20.0),
//                alignment: Alignment.center,
//                child: Stack(
//                  children: <Widget>[
//                    // may need to switch order of these children as render
//                    // order of stacks affects click-ability
//                    Center(
//                      child: Text(
//                        'Tips to Separate Victim and Perpetrator',
//                        style: TextStyle(color: purple.shade500, fontSize: 30),
//                        textAlign: TextAlign.center,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Divider(
//                color: background.shade600,
//                thickness: 3.0,
//              ),
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
                          textAlign: TextAlign.center,
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
