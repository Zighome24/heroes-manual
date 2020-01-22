import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';

class HMAppBar extends AppBar {

  HMAppBar({
    Key key,
    String title = "Heroes Manual",
    Color titleColor = purple,
    IconData leadingIcon = Icons.arrow_back_ios,
    bool showLeading = false,
    Function leadingAction,
    IconData trailingIcon = Icons.help_outline,
    bool showTrailing = false,
    BuildContext context,
  }) : super(
      key: key,
      title: Text(title),
      textTheme: TextTheme(
        title: TextStyle(
          color: titleColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: showLeading ? IconButton(
        onPressed: leadingAction,
        icon: Icon(
          leadingIcon,
          color: purple,
          size: 28,
        ),
      ) : Container(),
      actions: <Widget>[showTrailing ? IconButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/tutorial");
          debugPrint("Tutorial Navigation, uncomment line above when tutorial made");
        },
        icon: Icon(
          trailingIcon,
          color: purple,
          size: 28,
        ),
      ) : Container()],
      bottom: TabBar(tabs: null)
    );


}