import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/pages/training/training_start.dart';
import 'package:heroes_manual/pages/quizzes/quiz_start.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/widgets/categorical_horizontal_scroller.dart';
import 'package:heroes_manual/utility/main_menu_resc.dart';
import 'package:heroes_manual/utility/strings.dart';

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
        showTrailing: false,
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
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Screening',
                    routes: true,
                    elementTitlesOrRoutes: screenRoutes,
                  ),
                  Divider(
                    color: accent,
                    height: 10,
                    thickness: 10,
                  ),
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Resources',
                    elementTitlesOrRoutes: resourceRoutes,
                    routes: true,
                  ),
                  Divider(
                    color: accent,
                    height: 10,
                    thickness: 10,
                  ),
                  _trainings.length == 0 ? Container() :
                  CategoricalHorizontalScroller(
                    categoryTitle: 'Training',
                    routes: false,
                    elementTitlesOrRoutes: _trainings,
                    routeTo: TrainingStart.route,
                  ),
                  Divider(
                    color: accent,
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
                        flex: 20,
                        child: Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: SingleChildScrollView(
                            child: Column(
//                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      style: new TextStyle(
                                        fontSize: 15.0,
                                        color: purple.shade500,
                                      ),
                                      children: <TextSpan>[
                                        new TextSpan(text: 'Disclaimer:', style: new TextStyle(fontWeight: FontWeight.bold)),
                                        new TextSpan(text: ' The information contained in this application is '
                                          + 'derived from the domestic violence literature as listed under Sources. Every '
                                          + 'effort has been made to provide relevant, accurate, and evidence-based information.'
                                          + 'The authors assume no liability for any injury, death, or property damage associated'
                                          + 'with the application’s use. Further, the use of this application is not intended to '
                                          + 'replace professional help, counseling, and/or treatment. Users are encouraged to seek '
                                          + 'additional information from qualified professionals as needed to assure their safety '
                                          + 'and well-being at all times.', ),
                                      ],
                                    ),
                                  )

                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: IntrinsicHeight(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [purple.shade600, Colors.deepPurple[400]],
                                                  begin: Alignment.bottomRight,
                                                  end: Alignment.topLeft
                                              )
                                          ),
                                          child: Text(
                                            'About the App',
                                            style: new TextStyle(color: Colors.white, fontSize: 25),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),

                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Our project, Heroes\' Manual, aims to serve as a quick, '
                                        + 'intuitive guide that law enforcement officers and other '
                                        + 'service providers can use for resources and instruction '
                                        + 'on handling domestic violence situations.',
                                        //  or some standardized/uniform font style for the app
                                        style: new TextStyle(color: purple.shade500, fontSize: 20),
                                        textAlign: TextAlign.center)
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Junior Design Team 9317:\nAlex Levine, Sophie Marcus'
                                        + ', Sirila Padi, Paula Ruiz, Justin Ziegler',
                                        style: new TextStyle(color: purple.shade500, fontSize: 20),
                                        textAlign: TextAlign.center)
                                ),
                                Container(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Sponsor: Ann McClellan',
                                        style: new TextStyle(color: purple.shade500, fontSize: 20),
                                        textAlign: TextAlign.center,)
                                ),
                                Padding(
                                    padding: EdgeInsets.all(5),
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(15),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [purple.shade600, Colors.deepPurple[400]],
                                                    begin: Alignment.bottomRight,
                                                    end: Alignment.topLeft
                                                )
                                            ),
                                            child: Text(
                                              'Sources',
                                              style: new TextStyle(color: Colors.white, fontSize: 25),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),
//                                Container(
//                                  padding: const EdgeInsets.all(15.0),
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    'Sources',
//                                    style: TextStyle(color: purple.shade500, fontSize: 30),
//                                    textAlign: TextAlign.center,
//                                  ),
//                                ),
//                                Divider(
//                                  color: background.shade600,
//                                  thickness: 3.0,
//                                ),
                                Container( //make list of sources from strings.dart
                                  //flex: 8,
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: ScrollPhysics(),
                                      itemCount: sources.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          padding: const EdgeInsets.all(7.0),
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            sources[index],
                                            style: TextStyle(color: purple.shade600, fontSize: 20),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (BuildContext context, int index)
                                      => Divider(
                                        color: background.shade600,
                                        thickness: 3.0,
                                      ),
                                    ),
                                  ),
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