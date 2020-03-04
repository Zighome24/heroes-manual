import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';

class CategoricalHorizontalScroller extends StatelessWidget {
  // TODO: have the number of boxies passed in as constructor argument
  static const List<String> elements = <String>['A', 'B', 'C', 'D', 'E', 'F',
    'G', 'H', 'I'];
  final List<int> colorCodes = <int>[600, 500, 400, 300, 200, 300, 400, 500, 600];

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: 50,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: elements.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRect(
              child: Container(
                margin: const EdgeInsets.all(2),
                height: 10,
                  color: purple.shade500,
                  padding: EdgeInsets.all(3),
                child: Center(
                    child: Text(
                        'Entry ${elements[index]}'
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