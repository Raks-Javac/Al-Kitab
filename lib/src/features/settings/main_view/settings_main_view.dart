import 'package:flutter/material.dart';

import '../../../core/navigation/navigation_1.0.dart';
import '../../../shared/render/render_svg.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../guidelines/guidelines.dart';

class SettingsMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KWidgetsCustomAppBar(
        leadingIcon: Container(),
        title: "Settings",
        trailing: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              ...SettingsTitleObject.setingsOptions().map((e) {
                return KWidgetsSettingsCustomTile(
                  title: e.tileTitle!,
                  iconPathInSvg: e.iconPath!,
                  onTap: e.onTap!,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class KWidgetsSettingsCustomTile extends StatelessWidget {
  final String title;
  final String iconPathInSvg;
  final Function() onTap;
  final Widget? trailingIcon;
  const KWidgetsSettingsCustomTile({
    required this.iconPathInSvg,
    required this.onTap,
    required this.title,
    this.trailingIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          children: [
            NormalRenderSvg(
              svgPath: iconPathInSvg,
            ),
            addHorizontalSpacing(15),
            Expanded(
              child: Text(
                title,
              ),
            ),
            if (trailingIcon != null) trailingIcon!,
          ],
        ),
      ),
    );
  }
}

class SettingsTitleObject {
  final String? tileTitle;
  final String? iconPath;
  final Function()? onTap;
  SettingsTitleObject({this.iconPath, this.tileTitle, this.onTap});

  static List<SettingsTitleObject> setingsOptions() {
    return [
      SettingsTitleObject(
          tileTitle: "Theme", iconPath: KIcons.copyIcon, onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Share Al - kitab to a Friend",
          iconPath: KIcons.copyIcon,
          onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Leave a Review", iconPath: KIcons.copyIcon, onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Contact Us", iconPath: KIcons.copyIcon, onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Meet The Team", iconPath: KIcons.copyIcon, onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Help & Guildlines",
          iconPath: KIcons.copyIcon,
          onTap: () {
            KNavigator.navigateToRoute(HelpGuidelinesView());
          }),
      SettingsTitleObject(
          tileTitle: "Share App", iconPath: KIcons.copyIcon, onTap: () {}),
    ];
  }
}
