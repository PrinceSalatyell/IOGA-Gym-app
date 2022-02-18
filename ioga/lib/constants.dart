import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xE9F3F7FB);
const kLightTerciaryColor = Color(0x45F3F7FB);
Color? kAccentColor = Colors.amber[700];
const kAccentSecondaryColor = Color(0xFFD59A10);

final kTitleTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w400,
);

final kButtonTextStyle = TextStyle(
  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  timePickerTheme: TimePickerThemeData(
    backgroundColor: kDarkSecondaryColor,
    dialHandColor: kAccentColor,
    dialBackgroundColor: Colors.white70,
    dialTextColor: Colors.black,
    entryModeIconColor: kAccentColor,
    dayPeriodColor: kAccentColor!.withOpacity(0.24),
    dayPeriodTextColor: kAccentColor,
    hourMinuteColor: kAccentColor!.withOpacity(0.24),
    hourMinuteTextColor: kAccentColor
  ),
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
    color: kLightSecondaryColor,
  ),
  textTheme: ThemeData.dark().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kLightSecondaryColor,
    displayColor: kLightSecondaryColor,
  ),
);

final kLightTheme = ThemeData(
  timePickerTheme: TimePickerThemeData(
      backgroundColor: kLightSecondaryColor,
      dialHandColor: kAccentColor,
      dialBackgroundColor: Colors.black54,
      dialTextColor: Colors.white,
      entryModeIconColor: kAccentColor,
      dayPeriodColor: kAccentColor!.withOpacity(0.12),
      dayPeriodTextColor: kAccentColor,
      hourMinuteColor: kAccentColor!.withOpacity(0.12),
      hourMinuteTextColor: kAccentColor
  ),
  brightness: Brightness.light,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kLightSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
    color: kDarkSecondaryColor,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    fontFamily: 'SFProText',
    bodyColor: kDarkSecondaryColor,
    displayColor: kDarkSecondaryColor,
  ),
);