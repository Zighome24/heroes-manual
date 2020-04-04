import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class SimpleVerticalTitledList extends StatelessWidget {
  final String pageTitle;
  final List<String> listItems;
  final String source;
  final String pageSubTitle;

  SimpleVerticalTitledList(
      {
        this.pageTitle,
        this.pageSubTitle,
        this.listItems,
        this.source}
      );

  // TODO: put in overlay for Source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRect(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Text(pageTitle,
                    style: new TextStyle(
                        color: purple.shade500,
                        fontSize: 35
                    )
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                alignment: Alignment.center,
                child: Text(pageSubTitle,
                  style: TextStyle(
                    color: purple.shade600,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(
                color: background.shade600,
                thickness: 3.0,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: listItems.length,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index)
                    => Divider(
                      color: background.shade600,
                      thickness: 2.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          listItems[index],
                          style: TextStyle(
                              color: purple.shade500,
                              fontSize: 18
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}