import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/utility/colors.dart';

class SimpleVerticalTitledList extends StatelessWidget {
  final String pageTitle;
  final List<String> listItems;
  final String source;

  SimpleVerticalTitledList(
      {
        this.pageTitle,
        this.listItems,
        this.source}
      );

  // TODO: put in overlay for Source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(pageTitle,
                style: new TextStyle(
                    color: purple.shade500,
                    fontSize: 20
                )
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: listItems.length,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.label),
                  title: Text(listItems[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}