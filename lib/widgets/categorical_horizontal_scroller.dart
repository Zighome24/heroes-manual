import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroes_manual/utility/colors.dart';

class CategoricalHorizontalScroller extends StatelessWidget {
  static const String section_name = 'Organizations';
  final List<String> elementTitlesOrRoutes;
  final String categoryTitle;
  final bool routes;
  final String routeTo;

  CategoricalHorizontalScroller(
      {this.categoryTitle,
        this.routes,
        this.elementTitlesOrRoutes,
        this.routeTo}
      );

  @override
  Widget build(BuildContext context) {
    final double scrollingSectionHeight = 100;
    final double elementalWidth = 140;

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
                  categoryTitle,
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

                itemCount: elementTitlesOrRoutes.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRect(
                    child: Container(
                      width: elementalWidth,
                      margin: const EdgeInsets.all(2),
                      color: purple.shade500,
                      padding: EdgeInsets.all(3),
                      child: GestureDetector(
                        onTap: () => this.routes ?
                        Navigator.pushNamed(context, elementTitlesOrRoutes[index])
                            : Navigator.pushNamed(context, routeTo,
                            arguments: elementTitlesOrRoutes[index]),
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(3),
                          child: Text(routes ?
                          '${elementTitlesOrRoutes[index][1].toUpperCase()}'
                              '${elementTitlesOrRoutes[index].substring(2)}'
                              : elementTitlesOrRoutes[index].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
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