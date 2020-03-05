import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
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
        showLeading: true,
        leadingAction: () => showOverlay(context),
        leadingIcon: Icons.info_outline,
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
                            child: Text('Created by Team Helping Our Heroes, whose members '
                              + 'are students of the Georgia Institute of Technology, our '
                              + 'project, Heroes\' Manual, aims to serve as a quick, '
                              + 'intuitive guide that law enforcement officers and other '
                              + 'service providers can use for resources and instruction '
                              + 'on handling domestic violence situations.',
                              //TODO: change the source of the purple color and style to main
                              //  or some standardized/uniform font style for the app
                              style: new TextStyle(color: purple.shade500, fontSize: 20),
                              textAlign: TextAlign.center,
                            )
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