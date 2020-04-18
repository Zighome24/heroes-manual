import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/widgets/simple_vertical_titled_list.dart';
import 'package:heroes_manual/utility/strings.dart';

class RedFlags extends StatelessWidget {
  static const String route = '/red_flags';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: false,
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: ClipRect(
          child: SimpleVerticalTitledList(
            pageTitle: "Red Flags",
            pageSubTitle: red_flags_subtitle,
            source: source_red_flags,
            listItems: red_flags
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
                                                  padding: const EdgeInsets.all(30.0),
                                                  child: Text('Sources',
                                                      style: TextStyle(
                                                          color: purple.shade500,
                                                          fontSize: 20))
                                              ),
                                              Container(
                                                  padding: const EdgeInsets.all(30.0),
                                                  child: Text(source_red_flags,
                                                      style: TextStyle(
                                                          color: purple.shade500,
                                                          fontSize: 20))
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
    if(source_red_flags.isNotEmpty) {
      overlayState.insert(overlayEntry);
    }
  }
}