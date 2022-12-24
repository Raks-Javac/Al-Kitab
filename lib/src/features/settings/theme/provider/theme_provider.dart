import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/functions.dart';

class ThemeProvider extends ChangeNotifier {
  static AppThemeEnum themeStatus = AppThemeEnum.primaryMode;
  static int appIndex = 0;
  int get getAppIndex => appIndex;
  AppThemeEnum get getAppTheme => themeStatus;
  changeAppTheme(AppThemeEnum status) {
    themeStatus = status;
    KAppConstants.appThemeEnum = status;
    notifyListeners();
    logConsole(themeStatus);
  }

  changeAppIndex(int indexState) {
    indexState = appIndex;
    notifyListeners();
  }
}
