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
          trailingIcon: Icons.info_outline,
          trailingAction: () => showOverlay(context),

        ),
        body: SafeArea(
          child: Center(
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
                                  color: purple.shade600,
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
        ),
        bottomNavigationBar: HMBottomNavBar(),
    );
  }
  showOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry =
//    return Overlay.of(context).insert(
    OverlayEntry(
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Flexible(
                                      flex: 1,
                                      child: Row(
                                          children: <Widget>[
                                            IconButton(
                                              onPressed: () => overlayEntry.remove(),
                                              icon: Icon(
                                                Icons.arrow_back_ios,
                                                color: purple.shade500,
                                              ),
                                              iconSize: 28,
                                            ),
                                            Spacer()
                                          ]
                                      )
                                  ),
                                  Expanded(
                                      flex: 9,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 15.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                                  child: Text("Source",
                                                      style: TextStyle(
                                                          color: purple.shade500,
                                                          fontSize: 30,
                                                          fontWeight:FontWeight.bold)
                                                  )
                                              ),
                                              Container(
                                                  padding: const EdgeInsets.all(30.0),
                                                  child: Text(source_not_separate_screening_tips,
                                                      style: TextStyle(
                                                          color: purple.shade500,
                                                          fontSize: 20)
                                                  )
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
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
}