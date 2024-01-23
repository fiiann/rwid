import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rwid/core/constant/colors.dart';

class CustomTextStyle {
  static final TextStyle _textStyle =
      GoogleFonts.inter(color: CustomColors.lightTextPrimary);

  static TextStyle get h5 {
    double fontSize = 24;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.medium.value);
  }

  static TextStyle h6 = _textStyle.copyWith(
      fontSize: 20, height: 1.2, fontWeight: CustomFontWeight.medium.value);

  static TextStyle get lightTypographyH6 {
    double fontSize = 20;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 32.02),
        fontWeight: CustomFontWeight.medium.value,
        letterSpacing: 0.15);
  }

  static TextStyle get lightComponentsChip {
    double fontSize = 13;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 18),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightComponentsBadgeLabel {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20),
        fontWeight: CustomFontWeight.medium.value);
  }

  static TextStyle get lightComponentsHelper {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 20),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightTypographyCaption {
    double fontSize = 12;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 19.9),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.4);
  }

  static TextStyle lightComponentsButtonLarge = _textStyle.copyWith(
      fontSize: 15,
      height: 1.2,
      fontWeight: CustomFontWeight.medium.value,
      letterSpacing: 0.46);

  static TextStyle lightComponentsButtonMedium = _textStyle.copyWith(
      fontSize: 14,
      height: 1.2,
      fontWeight: CustomFontWeight.medium.value,
      letterSpacing: 0.46);

  static TextStyle lightTypographyBody1SemiBold = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.semiBold.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody1 = _textStyle.copyWith(
    fontSize: 16,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody2 = _textStyle.copyWith(
    fontSize: 14,
    height: 1.2,
    fontWeight: CustomFontWeight.regular.value,
    letterSpacing: 0.15,
  );

  static TextStyle lightTypographyBody2SemiBold = _textStyle.copyWith(
    fontSize: 14,
    height: 1.2,
    fontWeight: CustomFontWeight.semiBold.value,
    letterSpacing: 0.15,
  );

  static TextStyle get body1 {
    double fontSize = 16;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body1SemiBold {
    double fontSize = 16;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.semiBold.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body2 {
    double fontSize = 14;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.regular.value,
        letterSpacing: 0.15);
  }

  static TextStyle get body2SemiBold {
    double fontSize = 14;
    return _textStyle.copyWith(
        fontSize: 14,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.semiBold.value,
        letterSpacing: 0.15);
  }

  static TextStyle get buttonLarge {
    double fontSize = 15;
    return _textStyle.copyWith(
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 26),
        fontWeight: CustomFontWeight.medium.value,
        letterSpacing: 0.15);
  }

  static TextStyle get lightComponentInputText {
    double fontSize = 16;
    return _textStyle.copyWith(
        letterSpacing: 0.15,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightComponentInputLabel {
    double fontSize = 12;
    return _textStyle.copyWith(
        letterSpacing: 0.15,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 12),
        fontWeight: CustomFontWeight.regular.value);
  }

  static TextStyle get lightComponentAlertTitle {
    double fontSize = 16;
    return _textStyle.copyWith(
        letterSpacing: 0.15,
        fontSize: fontSize,
        height: _fontHeight(fontSize: fontSize, figmaLineHeight: 24),
        fontWeight: CustomFontWeight.medium.value);
  }
}

double _fontHeight(
        {required double fontSize, required double figmaLineHeight}) =>
    figmaLineHeight / fontSize;

enum CustomFontWeight {
  thin(FontWeight.w100),
  extraLight(FontWeight.w200),
  light(FontWeight.w300),
  regular(FontWeight.w400),
  medium(FontWeight.w500),
  semiBold(FontWeight.w600),
  bold(FontWeight.w700),
  extraBold(FontWeight.w800);

  final FontWeight value;

  const CustomFontWeight(this.value);
}
