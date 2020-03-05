import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:heroes_manual/pages/screening_page.dart';

class HMBottomNavBar extends StatelessWidget {

  final bool isHomeSelected, isMatrixSelected, isScreeningSelected;

  static const double icon_size = 32;

  static const double navbar_height = 64;

  const HMBottomNavBar({
    this.isHomeSelected = false,
    this.isMatrixSelected = false,
    this.isScreeningSelected = false});

  static const double spacer_width = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: purple.shade500,
      constraints: BoxConstraints(
        maxHeight: navbar_height
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: isHomeSelected ? (){ debugPrint('Already Home'); } : () {
              Navigator.pushNamed(context, '/');
            },
            icon: Icon(
              isHomeSelected ? MdiIcons.home : MdiIcons.homeOutline,
              color: Colors.white,
              size: icon_size,
            ),
          ),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minWidth: spacer_width,
              maxWidth: spacer_width,
              maxHeight: navbar_height - 4,
            ),
          ),
          IconButton(
            onPressed: isMatrixSelected ? (){} : () {
              debugPrint("Matrix Selected");
              //Navigator.pushNamed(context, '/matrix');
            },
            icon: Icon(
              isMatrixSelected ? MdiIcons.viewDashboard : MdiIcons.viewDashboardOutline,
              color: Colors.white,
              size: icon_size,
            ),
          ),
          Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minWidth: spacer_width,
              maxWidth: spacer_width,
              maxHeight: navbar_height - 4,
            ),
          ),
          IconButton(
            onPressed: isScreeningSelected ? (){} : () {
              debugPrint("Checklist Selected");
              //Navigator.pushNamed(context, Screening.route);
            },
            icon: Icon(
              isScreeningSelected ? MdiIcons.checkCircle : MdiIcons.checkCircleOutline,
              color: Colors.white,
              size: icon_size,
            ),
          )
        ],
      ),
    );
  }
}