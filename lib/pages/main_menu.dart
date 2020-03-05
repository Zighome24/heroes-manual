import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/pages/training/training_start.dart';
import 'package:heroes_manual/pages/perpetrator_present.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/categorical_horizontal_scroller.dart';
import 'package:heroes_manual/utility/main_menu_resc.dart';

class MainMenu extends StatefulWidget {
  static const String route = '/fancy_main_menu';

  @override
  State createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
// going to set the state after loading is done
  List<String> _trainings = [];
  List<String> _quizzes = [];

  @override
  Widget build(BuildContext context) {
    Training.loadTrainingNames().then((lessonNames) {
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
                    routeTo: TrainingStart.route,
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
                    //
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