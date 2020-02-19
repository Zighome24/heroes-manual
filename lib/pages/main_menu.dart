import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class MainMenu extends StatefulWidget {
  static const String route = '/fancy_main_menu';
  // TODO: add flutter loading icon for app startup - might throw an error if the waitng is so short - look at LessonStart for example with empty lesson, if empty - show empty container, that's where the load icon would be I think. Once it loads, set the state
  // TODO: it will just be loading quiz and lesson names - comes in as a map, just need to get the keys
  // TODO: ignore icons for cards for now
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
      ),
      // TODO: implement body
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true,),
    );
  }
}