import 'package:flutter/material.dart';
import 'package:heroes_manual/data/data.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/pages/matrix/stakeholder_info.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';

class MatrixPage extends StatefulWidget {
  static const String route = "/matrix";

  @override
  State<StatefulWidget> createState() => _MatrixPageState();
}

class _MatrixPageState extends State<MatrixPage> {
  Matrix _matrix = Matrix.emptyMatrix;


  @override
  Widget build(BuildContext context) {
    Matrix.localMatrixFactory().then((matrix)
    {
      setState(() { _matrix = matrix; });
    });

    return Scaffold(
      appBar: HMAppBar(
        showLeading: true,
        leadingAction: () => Navigator.pop(context),
        showTrailing: false,
      ),
      body: _matrix == Matrix.emptyMatrix ? Container() :
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Stakeholders",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _matrix.matrix.length,
                itemBuilder: (BuildContext context, int index) {
                  List<String> stakeholders = _matrix.matrix.keys.toList();
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: RaisedButton(
                      onPressed: () { Navigator.pushNamed(context, StakeholderInfoPage.route, arguments: _matrix.matrix[stakeholders[index]]); },
                      child: Text(
                        stakeholders[index],
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: purple.shade500
                        ),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),
      bottomNavigationBar: HMBottomNavBar(isMatrixSelected: true),
    );
  }
}