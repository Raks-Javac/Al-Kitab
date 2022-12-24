import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../../shared/render/render_svg.dart';
import '../../../../shared/res/res.dart';
import '../../../../shared/widgets/app_bar/backHome.dart';
import '../../../../shared/widgets/app_bar/custom_app_bar.dart';
import '../provider/theme_provider.dart';

class ThemeSettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KWidgetsCustomAppBar(
        leadingIcon: KwidgetBackButton(),
        title: "Theme",
      ),
      body: Builder(builder: (context) {
        Provider.of<ThemeProvider>(context, listen: true);
        return SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ThemeProvider>()
                          .changeAppTheme(AppThemeEnum.primaryMode);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: KColors.primaryColor,
                        radius: 40,
                        child: KAppConstants.appThemeEnum ==
                                AppThemeEnum.primaryMode
                            ? RenderSvg(
                                svgPath: KIcons.checkIcon,
                                color: KColors.whiteColor,
                              )
                            : SizedBox.shrink(),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context
                          .read<ThemeProvider>()
                          .changeAppTheme(AppThemeEnum.whiteMode);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          backgroundColor: KColors.whiteColor,
                          radius: 40,
                          child: KAppConstants.appThemeEnum ==
                                  AppThemeEnum.whiteMode
                              ? RenderSvg(
                                  svgPath: KIcons.checkIcon,
                                  color: KColors.primaryColor,
                                )
                              : SizedBox.shrink()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
