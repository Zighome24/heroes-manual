import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class SafetyPlan extends StatelessWidget {
  static const String route = "/safety_plan";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: false,
        leadingAction: () => Navigator.pop(context)
      ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                        "Safety Plan Information",
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.black
                        )
                    ),
                  ),
                  Text(
                    safety_plan_info,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset("lib/images/safety_plan.png"),
                      Text(
                        "QR Code",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      Divider(
                        indent: 45,
                        endIndent: 45,
                        height: 16,
                      ),
                      InkWell(
                        child: Text(
                          "Web Link",
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.indigo,
                              decoration: TextDecoration.underline
                          ),
                        ),
                        onTap: () => launch("http://www.ncdsv.org/images/DV_Safety_Plan.pdf"),
                      )
                    ],
                  )
                ],
              )
            ),
          )
        ),
        bottomNavigationBar: HMBottomNavBar()
    );
  }
}