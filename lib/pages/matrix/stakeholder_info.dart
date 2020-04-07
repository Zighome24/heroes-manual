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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
              onPressed: currentState == SIPTabBarState.ATTITUDES
                ? () { debugPrint("Attitude already choosen"); }
                : () { setState(() { currentState = SIPTabBarState.ATTITUDES; });},
              icon: Icon(
                currentState == SIPTabBarState.ATTITUDES ? MdiIcons.face
                    : MdiIcons.faceOutline,
                size: tabBarHeight / 2,
                color: Colors.white,
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
          IconButton(
              onPressed: currentState == SIPTabBarState.ACTIONS
                ? () { debugPrint("Action already choosen"); }
                : () { setState(() { currentState = SIPTabBarState.ACTIONS; });},
              icon: Icon(
                currentState == SIPTabBarState.ACTIONS ? MdiIcons.accountTieVoice
                    : MdiIcons.accountTieVoiceOutline,
                size: tabBarHeight / 2,
                color: Colors.white,
              )
          ),
        ],
      ),
    );

    debugPrint(currentState.toString());

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
            child: currentState == SIPTabBarState.ATTITUDES ?
            /*ListView.builder(
              itemBuilder: null,
            ) : ListView.builder(
              itemBuilder: null
            )*/
            Container() : Container()
          )
        ]
      ),
      // TODO : Should we have the bottom navigation bar
      bottomNavigationBar: HMBottomNavBar(isMatrixSelected: false), //TODO : Should this be true?
    );
  }
}