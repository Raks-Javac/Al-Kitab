import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/functions.dart';

class ThemeProvider extends ChangeNotifier {
  static AppThemeEnum themeStatus = AppThemeEnum.primaryMode;
  AppThemeEnum get getAppTheme => themeStatus;
  changeAppTheme(AppThemeEnum status) {
    themeStatus = status;
    KAppConstants.appThemeEnum = status;
    notifyListeners();
    logConsole(themeStatus);
  }
}
