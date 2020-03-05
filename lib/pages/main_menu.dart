import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/lesson/lesson_start.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/categorical_horizontal_scroller.dart';
import 'package:heroes_manual/utility/main_menu_resc.dart';

class MainMenu extends StatefulWidget {
  static const String route = '/fancy_main_menu';

  // TODO: add flutter loading icon for app startup - might throw an error if the waiting is so short
  // look at LessonStart for example with empty lesson, if empty - show empty container, that's where the load icon would be I think. Once it loads, set the state

  @override
  State createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
// going to set the state after loading is done
  List<String> _trainings = [];
  List<String> _quizzes = [];

  @override
  Widget build(BuildContext context) {
    Lesson.loadLessonNames().then((lessonNames) {
      setState(() {
        _trainings = lessonNames;
      });
    });

    Quiz.loadQuizNames().then((quizNames) {
      setState(() {
        _quizzes = quizNames;
      });
    });

    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
      ),
      body: SafeArea(
          child: ClipRect(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: ScrollPhysics(),
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  _trainings.length == 0 ? Container() :
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Trainings',
                    routes: false,
                    elementTitlesOrRoutes: _trainings,
                    routeTo: LessonStart.route,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 10,
                  ),
                  _quizzes.length == 0 ? Container() :
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Quizzes',
                    routes: false,
                    elementTitlesOrRoutes: _quizzes,
                    routeTo: QuizStart.route,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 10,
                  ),
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Resources',
                    elementTitlesOrRoutes: resourceRoutes,
                    routes: true,
                  ),
                  Divider(
                    color: Colors.white,
                    height: 10,
                    thickness: 10,
                  ),
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Screenings',
                    routes: true,
                    elementTitlesOrRoutes: debugScreenRoutes,
                  ),
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Roles',
                    routes: true,
                    elementTitlesOrRoutes: resourceRoutes,
                  )
                ],
              )
          )
      ),
      bottomNavigationBar: HMBottomNavBar(isHomeSelected: true),
    );
  }
}