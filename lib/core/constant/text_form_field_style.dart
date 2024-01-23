import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/custom_text_style.dart';

class TextFieldStyle {
  static OutlineInputBorder nonFocusedBorder = const OutlineInputBorder(
      borderSide:
          BorderSide(color: CustomColors.lightOtherOutlinedBorder, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(6)));

  static OutlineInputBorder errorBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: CustomColors.red, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(6)));

  static OutlineInputBorder focusedBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide:
          BorderSide(color: CustomColors.lightOtherOutlinedBorder, width: 2));

  static TextStyle errorTextStyle = CustomTextStyle.lightTypographyCaption
      .copyWith(color: CustomColors.red, height: 1);

  static TextStyle labelTextStyle = CustomTextStyle.lightTypographyCaption
      .copyWith(color: CustomColors.lightTextSecondary, height: 1.2);

  static TextStyle hintTextStyle = CustomTextStyle.lightComponentInputText
      .copyWith(color: CustomColors.lightTextSecondary, height: 1.3);

  static TextStyle valueTextStyle = CustomTextStyle.lightComponentInputText
      .copyWith(color: CustomColors.lightTextPrimary, height: 1.3);

  static EdgeInsets contentPadding = const EdgeInsets.fromLTRB(17, 17, 17, 6);

  static InputDecoration inputDecoration = InputDecoration(
      contentPadding: contentPadding,
      border: errorBorder,
      enabledBorder: nonFocusedBorder,
      focusedBorder: focusedBorder,
      errorBorder: nonFocusedBorder,
      focusedErrorBorder: focusedBorder,
      errorStyle: errorTextStyle,
      labelStyle: labelTextStyle,
      hintStyle: hintTextStyle);
}
