part of 'res.dart';

abstract class KThemes {
  KThemes._();
  static ThemeData get primaryMode {
    return ThemeData(
        scaffoldBackgroundColor: KColors.primaryColor,
        primaryColor: KColors.primaryColor,
        indicatorColor: KColors.primaryColor,
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

  static ThemeData returnThemeBasedOnMode(AppThemeEnum status) {
    if (status == AppThemeEnum.whiteMode) {
      return whiteMode;
    }
    return primaryMode;
  }
}
