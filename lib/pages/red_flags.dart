import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heroes_manual/utility/hm_appbar.dart';
import 'package:heroes_manual/widgets/simple_vertical_titled_list.dart';

class RedFlags extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HMAppBar(
        showTrailing: true,
        showLeading: true,
        leadingAction: () => showOverlay(context),
        leadingIcon: Icons.info_outline,
      ),
      body: SafeArea(
        child: ClipRect(
          child: SimpleVerticalTitledList("Red Flags", ),
        ),
      )
    );
  }
}