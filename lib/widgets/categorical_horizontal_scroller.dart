import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/utility/colors.dart';

class CategoricalHorizontalScroller extends StatelessWidget {
  // TODO: have the number of boxies passed in as constructor argument
  static const List<String> elements = <String>['A', 'B', 'C', 'D', 'E', 'F',
    'G', 'H', 'I'];
  static const String section_name = 'Organizations';
  List<String> elementTitlesOrRoutes;
  String categoryTitle;
  bool routes;

  CategoricalHorizontalScroller(this.categoryTitle, this.routes,
      this.elementTitlesOrRoutes);

  @override
  Widget build(BuildContext context) {
    final double scrollingSectionHeight = 100;
    final double elementalWidth = 100;

    return ClipRect(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 50,
            color: purple.shade200,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                  section_name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                textAlign: TextAlign.center,
                textScaleFactor: 2,
              ),
            )
          ),
          Container(
            height: scrollingSectionHeight,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              padding: const EdgeInsets.all(8),

              itemCount: elements.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRect(
                  child: Container(
                    width: elementalWidth,
                    margin: const EdgeInsets.all(2),
                      color: purple.shade500,
                      padding: EdgeInsets.all(3),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(3),
                        child: Text(
                            'Entry ${elements[index]}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.black,
                height: 10,
                thickness: 10,
              ),
            )
          ),
        ],
      ),
    );
  }
}

/*class ListElement extends StatelessWidget {
  int r;
  int g;
  int b;

  ListElement({this.r, this.g, this.b});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
//      height: 50,
//      padding: EdgeInsets.fromLTRB(10,10,0,0),
      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
      color: Color.fromRGBO(r, g, b, 1),
    );
  }
}*/