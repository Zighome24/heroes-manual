import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StakeholderInfoPage extends StatefulWidget {
  static const String route = '/stakeholder';

  @override
  State<StatefulWidget> createState() => StakeholderInfoPageState();
}

enum SIPTabBarState {
  ATTITUDES,
  ACTIONS
}

class StakeholderInfoPageState extends State<StakeholderInfoPage> {
  static const double tabBarHeight = 40;
  static const double spacerWidth = 3;

  SIPTabBarState currentState = SIPTabBarState.ATTITUDES;

  @override
  Widget build(BuildContext context) {
    final Stakeholder _stakeholder = ModalRoute.of(context).settings.arguments as Stakeholder;

    Widget tabBar = Container(
      color: purple.shade500,
      constraints: BoxConstraints(
          maxHeight: tabBarHeight
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: currentState == SIPTabBarState.ATTITUDES
                  ? () { debugPrint("Attitude already choosen"); }
                  : () { setState(() { currentState = SIPTabBarState.ATTITUDES; });},
              child: Icon(
                currentState == SIPTabBarState.ATTITUDES ? MdiIcons.face
                    : MdiIcons.faceOutline,
                size: tabBarHeight / 2,
                color: Colors.white,
              )
            )
          ),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minWidth: spacerWidth,
              maxWidth: spacerWidth,
              maxHeight: tabBarHeight,
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: currentState == SIPTabBarState.ACTIONS
                  ? () { debugPrint("Action already choosen"); }
                  : () { setState(() { currentState = SIPTabBarState.ACTIONS; });},
              child: Icon(
                currentState == SIPTabBarState.ACTIONS ? MdiIcons.accountTieVoice
                    : MdiIcons.accountTieVoiceOutline,
                size: tabBarHeight / 2,
                color: Colors.white,
              )
            )
          )
        ],
      ),
    );

    return Scaffold(
      appBar: HMAppBar(
        title: _stakeholder.title,
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
        showTrailing: true,
        trailingAction: () {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: tabBar,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _stakeholder.attitudes.length + 1,
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? Padding(
                  padding: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    currentState == SIPTabBarState.ATTITUDES ? "Attitudes, Perspective, Challenges, Issues, Barriers, Obstacles, and Views" : "Actions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black
                    ),
                  ),
                ) : Padding(
                  padding: EdgeInsets.all(10),
                  child: currentState == SIPTabBarState.ATTITUDES ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _stakeholder.attitudes[index-1].facet,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.black
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, left: 10),
                        child: Text(
                          _stakeholder.attitudes[index-1].info,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.black
                          )
                        )
                      )
                    ]
                  ) : Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      _stakeholder.actions[index-1],
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )
                  ),
                );
              },
            )
          )
        ]
      ),
      // TODO : Should we have the bottom navigation bar
      bottomNavigationBar: HMBottomNavBar(isMatrixSelected: false), //TODO : Should this be true?
    );
  }
}