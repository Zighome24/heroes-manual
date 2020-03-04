import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/categorical_horizontal_scroller.dart';

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
// going to set the state after loading is done
  List<String> _trainings = new List<String>();

  @override
  Widget build(BuildContext context) {
    Lesson.loadLessonNames().then((lessonNames) {
      setState(() {
        _trainings = lessonNames;
      });
    });

    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
      ),
      body: SafeArea(
        // TODO: consider using ListView.separated
        child: ClipRect(
          child: CategoricalHorizontalScroller()
          ),
        ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }
}