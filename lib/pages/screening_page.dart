import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class Screening extends StatefulWidget {
  static const String route = '/screening_page';
  static var screeningTips = [ScreeningTip('Does your partner hit, kick or '
      'otherwise hurt you?'),
    ScreeningTip('Does your partner try to run your life, or tell you what '
        'you can do or say?'),
    ScreeningTip('Does your partner stalk you, follow you around, or check up '
        'on you a lot?'),
    ScreeningTip('Does your partner put you down, call you names, or embarrass '
        'you in public?'),
    ScreeningTip('Does your partner make threats (e.g., to kick you out, report'
        ' you to immigration, or out you) or try to intimidate you?'),
    ScreeningTip('Does your partner demand sexual activity that you don’t want;'
        ' force you to have sex?'),
    ScreeningTip('Does your partner control all the money in your family?')];

  @override
  _ScreeningState createState() => _ScreeningState();
}

class ScreeningTip {
  var name = '';
  var selected = false;

  ScreeningTip(this.name);
}

class _ScreeningState extends State<Screening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          colors: [purple.shade600, Colors.deepPurple[400]],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Here is a list of questions to ask someone to determine '
                            'if the person may have been a victim of domestic'
                            ' violence.',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

//                Divider(
//                  color: purple.shade500,
//                  height: 5.0,
//                  thickness: 5.0,
//                ),
                FlatButton(
                  child: Text('Clear Selections',
                    style: new TextStyle(
                      color: purple.shade500)
                    ),
                  onPressed: () => {
                   Screening.screeningTips.forEach((tip) => tip.selected = false)
                  },
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: Screening.screeningTips.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRect(
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Card(
                              child: CheckboxListTile(
                                title: Text(
                                  Screening.screeningTips[index].name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: purple.shade700
                                  ),
                                ),
                                value: Screening.screeningTips[index].selected,
                                onChanged: (val) {
                                  setState(() {
                                    Screening.screeningTips[index].selected = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      
      bottomNavigationBar: HMBottomNavBar(isScreeningSelected: true),
    );
  }
}