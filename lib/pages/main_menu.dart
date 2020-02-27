import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class MainMenu extends StatefulWidget {
  static const String route = '/fancy_main_menu';

  // TODO: add flutter loading icon for app startup - might throw an error if the waiting is so short
  // look at LessonStart for example with empty lesson, if empty - show empty container, that's where the load icon would be I think. Once it loads, set the state
  // TODO: it will just be loading quiz and lesson names - comes in as a map, just need to get the keys
  // TODO: ignore icons for cards for now

  @override
  State createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
      ),
      body: SafeArea(
        // TODO: consider using ListView.separated
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // little cards for each thing
                ],
              ),
            ),
            Container(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  // little cards for things
                ],
              )
            )
          ]
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true,),
    );
  }
}