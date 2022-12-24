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
