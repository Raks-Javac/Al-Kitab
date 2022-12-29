part of 'res.dart';

abstract class KThemes {
  KThemes._();
  static ThemeData get primaryMode {
    return ThemeData(
        scaffoldBackgroundColor: KColors.primaryColor,
        primaryColor: KColors.primaryColor,
        indicatorColor: KColors.primaryColor,
        primaryColorDark: KColors.primaryColor3,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: KColors.primaryTileColor,
        primaryTextTheme: TextTheme(
          bodySmall: KTypography.smallTextLight,
          bodyMedium: KTypography.bodyTextLight,
          bodyLarge: KTypography.largeTextLight,
          displayMedium: KTypography.bodyTextLight,
          displayLarge: KTypography.largeTextLight,
          displaySmall: KTypography.smallTextLight,
        ),
        textTheme: TextTheme(
          bodySmall: KTypography.smallTextLight,
          bodyMedium: KTypography.bodyTextLight,
          bodyLarge: KTypography.largeTextLight,
          displayMedium: KTypography.bodyTextLight,
          displayLarge: KTypography.largeTextLight,
          displaySmall: KTypography.smallTextLight,
        ));
  }

  static ThemeData get whiteMode {
    return ThemeData(
        scaffoldBackgroundColor: KColors.whiteColor,
        primaryColor: KColors.primaryColor,
        indicatorColor: KColors.primaryColor,
        cardColor: KColors.primaryTileColor,
        primaryColorDark: KColors.primaryColor3,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryTextTheme: TextTheme(
          bodySmall: KTypography.smallTextLight.copyWith(color: KColors.black),
          bodyMedium: KTypography.bodyTextLight.copyWith(color: KColors.black),
          bodyLarge: KTypography.largeTextLight.copyWith(color: KColors.black),
          displayMedium:
              KTypography.bodyTextLight.copyWith(color: KColors.black),
          displayLarge:
              KTypography.largeTextLight.copyWith(color: KColors.black),
          displaySmall:
              KTypography.smallTextLight.copyWith(color: KColors.black),
        ),
        textTheme: TextTheme(
          bodySmall: KTypography.smallTextLight.copyWith(color: KColors.black),
          bodyMedium: KTypography.bodyTextLight.copyWith(color: KColors.black),
          bodyLarge: KTypography.largeTextLight.copyWith(color: KColors.black),
          displayMedium:
              KTypography.bodyTextLight.copyWith(color: KColors.black),
          displayLarge:
              KTypography.largeTextLight.copyWith(color: KColors.black),
          displaySmall:
              KTypography.smallTextLight.copyWith(color: KColors.black),
        ));
  }

  static ThemeData get blackMode {
    return ThemeData(
        scaffoldBackgroundColor: KColors.blackPrimaryColor,
        primaryColor: KColors.blackPrimaryColor,
        indicatorColor: KColors.blackPrimaryColor,
        primaryColorDark: KColors.blackPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardColor: KColors.blackCardColor,
        primaryTextTheme: TextTheme(
          bodySmall: KTypography.smallTextLight,
          bodyMedium: KTypography.bodyTextLight,
          bodyLarge: KTypography.largeTextLight,
          displayMedium: KTypography.bodyTextLight,
          displayLarge: KTypography.largeTextLight,
          displaySmall: KTypography.smallTextLight,
        ),
        textTheme: TextTheme(
          bodySmall: KTypography.smallTextLight,
          bodyMedium: KTypography.bodyTextLight,
          bodyLarge: KTypography.largeTextLight,
          displayMedium: KTypography.bodyTextLight,
          displayLarge: KTypography.largeTextLight,
          displaySmall: KTypography.smallTextLight,
        ));
  }

  static ThemeData returnThemeBasedOnMode(AppThemeEnum status) {
    if (status == AppThemeEnum.whiteMode) {
      return whiteMode;
    }
    if (status == AppThemeEnum.blackMode) {
      return blackMode;
    }

    return primaryMode;
  }
}
