import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/utility/hm_bottom_navbar.dart';
import 'package:heroes_manual/widgets/simple_vertical_titled_list.dart';
import 'package:heroes_manual/utility/strings.dart';

class RedFlags extends StatelessWidget {
  static const String route = '/red_flags';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
        showLeading: true,
        //leadingAction: () => showOverlay(context),
        leadingIcon: Icons.info_outline,
      ),
      body: SafeArea(
        child: ClipRect(
          child: SimpleVerticalTitledList(
            pageTitle: "Red Flags",
            pageSubTitle: red_flags_subtitle,
            source: source_red_flags,
            listItems: red_flags
          ),
        ),
      ),
      bottomNavigationBar: HMBottomNavBar(),
    );
  }
}