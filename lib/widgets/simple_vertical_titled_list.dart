import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [purple.shade600, Colors.deepPurple[400]],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        alignment: Alignment.center,

                        child: Text(pageTitle,
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 35
                            )
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        child: Text(pageSubTitle,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
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