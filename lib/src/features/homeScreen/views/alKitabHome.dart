import 'package:flutter/material.dart';

import '../../../shared/render/render_svg.dart';
import '../../../shared/res/res.dart';
import '../../../shared/widgets/app_bar/custom_app_bar.dart';
import 'drawer.dart';

class AlKitabHomeView extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: KWidgetsCustomAppBar(
        leadingIcon: IconButton(
          icon: RenderSvg(
            svgPath: KIcons.menuIcon,
            color: Theme.of(context).textTheme.bodyMedium!.color,
            svgHeight: 50,
            svgWidth: 50,
          ),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        title: "Al-Kitab",
      ),
      key: _scaffoldKey,
      drawer: AlKitabDrawer(
        context: context,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
