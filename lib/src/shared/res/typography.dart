part of 'res.dart';

abstract class KTypography {
  KTypography._();
  static String lightFontfamilyName = 'PLight';
  static String regularFontFamilyName = 'PRegular';
  static String boldFontFamilyName = 'PBold';
  static String normalFontFamilyName = 'PMedium';
  static TextStyle smallTextLight = TextStyle(
    fontFamily: lightFontfamilyName,
  );
  static TextStyle bodyTextLight = TextStyle(
    fontFamily: lightFontfamilyName,
    color: KColors.whiteColor,
    fontSize: 13.sp,
  );
  static TextStyle largeTextLight = TextStyle(
    fontFamily: lightFontfamilyName,
    color: KColors.whiteColor,
    fontSize: 25.sp,
  );
  static TextStyle smallTextRegular = TextStyle(
    fontFamily: regularFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 7.sp,
  );
  static TextStyle bodyTextRegular = TextStyle(
    fontFamily: regularFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 13.sp,
  );
  static TextStyle largeTextRegular = TextStyle(
    fontFamily: regularFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 25.sp,
  );
  static TextStyle smallTextBold = TextStyle(
    fontFamily: boldFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 7.sp,
  );
  static TextStyle bodyTextBold = TextStyle(
    fontFamily: boldFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 13.sp,
  );
  static TextStyle largeTextBold = TextStyle(
    fontFamily: boldFontFamilyName,
    color: KColors.whiteColor,
    fontSize: 25.sp,
  );
}
