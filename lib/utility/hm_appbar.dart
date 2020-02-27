import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/colors.dart';

class HMAppBar extends AppBar {

  HMAppBar({
    Key key,
    String title = "Heroes Manual",
    IconData leadingIcon = Icons.arrow_back_ios,
    bool showLeading = false,
    Function leadingAction,
    IconData trailingIcon = Icons.help_outline,
    bool showTrailing = false,
    Function trailingAction,
    BuildContext context,
  }) : super(
      key: key,
      title: Text(title),
      textTheme: TextTheme(
        title: TextStyle(
          color: purple.shade500,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: showLeading ? IconButton(
        onPressed: leadingAction,
        icon: Icon(
          leadingIcon,
          color: purple.shade500,
        ),
        iconSize: 28,
      ) : Container(),
      actions: <Widget>[showTrailing ? IconButton(
        onPressed: trailingAction,
        icon: Icon(
          trailingIcon,
          color: purple.shade500,
        ),
        iconSize: 28,
      ) : Container()],
    );


}