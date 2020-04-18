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

  showOverlay(BuildContext context, Stakeholder stakeholder) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
        builder: (context) => Material(
            type: MaterialType.transparency,
            child: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.grey.withOpacity(0.6),
                child: Padding(
                    padding: EdgeInsets.only(top: 85.0, bottom: 65.0, right: 15.0, left: 15.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Spacer(),
                                      Flexible(
                                        flex: 6,
                                        child: Text(
                                          "Sources",
                                          style: TextStyle(
                                            fontSize: 28.0,
                                            color: purple.shade500,
                                            fontWeight: FontWeight.bold
                                          )
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: IconButton(
                                          onPressed: () => overlayEntry.remove(),
                                          icon: Icon(
                                            Icons.close,
                                            color: purple.shade700,
                                          ),
                                          iconSize: 28,
                                        )
                                      )
                                    ]
                                  ),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: stakeholder.sources.length,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            stakeholder.sources[index],
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: purple.shade700
                                            ),
                                          )
                                        );
                                      }
                                    ),
                                  )
                                ]
                            )
                        )
                    )
                )
            )
        )
    );
    overlayState.insert(overlayEntry);
  }

  @override
  Widget build(BuildContext context) {
    final Stakeholder _stakeholder = ModalRoute.of(context).settings.arguments as Stakeholder;

    Widget tabBar = Container(
      constraints: BoxConstraints(
          maxHeight: tabBarHeight
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [purple.shade600, Colors.deepPurple[400]],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft
                ),
              ),
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
            child: Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [purple.shade600, Colors.deepPurple[400]],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft
                ),
              ),
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
        trailingAction: () => showOverlay(context, _stakeholder),
        trailingIcon: Icons.info_outline,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          tabBar,
          Expanded(
            child: ListView.builder(
              itemCount: _stakeholder.attitudes.length + 1,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return index == 0 ? Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    currentState == SIPTabBarState.ATTITUDES ? "Attitudes, Perspective, Challenges, Issues, Barriers, Obstacles, and Views" : "Actions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: purple.shade700
                    ),
                    textAlign: TextAlign.center,
                  ),
                ) : Padding(
                  padding: EdgeInsets.all(10),
                  child: currentState == SIPTabBarState.ATTITUDES ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                          gradient: LinearGradient(
                              colors: [purple.shade600, Colors.deepPurple[400]],
                              begin: Alignment.bottomRight,
                              end: Alignment.topLeft
                          ),
                        ),
                        alignment: Alignment.center,
                        constraints: BoxConstraints.expand(height: 30),
                        child: Text(
                          _stakeholder.attitudes[index-1].facet,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            //decoration: TextDecoration.underline,
                            color: Colors.white
                          )
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          _stakeholder.attitudes[index-1].info,
                          style: TextStyle(
                              fontSize: 17,
                              color: purple.shade700
                          )
                        )
                      )
                    ]
                  ) : Padding(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      _stakeholder.actions[index-1],
                      style: TextStyle(
                        fontSize: 18,
                        color: purple.shade700
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