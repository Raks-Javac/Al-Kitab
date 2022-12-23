import 'package:flutter/material.dart';

import 'appBarText.dart';

class KWidgetsCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? leadingIcon;
  final String? title;
  final List<Widget>? trailing;
  KWidgetsCustomAppBar({this.leadingIcon, this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Container(margin: EdgeInsets.only(left: 15), child: leadingIcon),
      title: BarText(appBarText: title),
      actions: [
        if (trailing != null) ...trailing!,
      ],
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}