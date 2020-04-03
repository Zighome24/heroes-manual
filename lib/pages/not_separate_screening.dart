import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class NotSeparateScreening extends StatelessWidget {
  static const String route = '/not_separate_screening';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        showTrailing: true,
        leadingAction: () => Navigator.pop(context),
      ),
      body: Center(
        child: ClipRect(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Tips to Screen Victim When Perpetrator is Nearby',
                        style: TextStyle(color: purple.shade500, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                color: background.shade600,
                thickness: 3.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                  child: ListView.separated(
                      itemBuilder: null,
                      separatorBuilder: null,
                      itemCount: null),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}