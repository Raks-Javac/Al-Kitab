import 'package:flutter/material.dart';

import '../../../shared/widgets/app_bar/custom_app_bar.dart';

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
        child: Column(
          children: [],
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

  List<SettingsTitleObject> setingsOptions() {
    return [
      SettingsTitleObject(tileTitle: "Theme", iconPath: "", onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Share Al - kitab to a Friend",
          iconPath: "",
          onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Leave a Review", iconPath: "", onTap: () {}),
      SettingsTitleObject(tileTitle: "Conatct Us", iconPath: "", onTap: () {}),
      SettingsTitleObject(
          tileTitle: "Meet The Team", iconPath: "", onTap: () {}),
      SettingsTitleObject(tileTitle: "", iconPath: "", onTap: () {}),
    ];
  }
}
