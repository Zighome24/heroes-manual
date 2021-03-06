import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/utility/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class Organizations extends StatelessWidget {
  static const String route = '/organizations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: false,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(

        child: ClipRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
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
                      'Important Organizations',
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: orgsTitles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: GestureDetector (
                          onTap: () => launch(orgsSites[index]),
                          child: Text(
                            orgsTitles[index],
                            textAlign: TextAlign.center,
                            style:
                              TextStyle(color: purple.shade600, fontSize: 20),
                          ),
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
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}