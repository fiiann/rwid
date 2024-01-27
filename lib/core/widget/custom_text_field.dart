import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/custom_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final String errorText;
  final int? maxLength;
  final int? minLines;
  final bool obscureText;
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final List<TextInputFormatter>? textInputFormatterList;
  final String? initialValue;
  final String prefixText;
  final String suffixText;
  final Color? fillColor;
  final InputBorder inputBorder;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets contentPadding;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextInputAction? textInputAction;
  final int? maxLine;
  final EdgeInsets padding;
  final Color errorColor;
  final bool readOnly;
  final TextStyle? labelStyle;
  final FocusNode? focusNode;

  const CustomTextFormField({
    this.labelText,
    this.onChanged,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.errorText = '',
    this.maxLength,
    this.errorColor = Colors.redAccent,
    this.textInputFormatterList,
    this.initialValue,
    this.fillColor,
    this.onTap,
    this.padding = EdgeInsets.zero,
    this.inputBorder = const OutlineInputBorder(),
    this.floatingLabelBehavior,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.prefixText = '',
    this.suffixText = '',
    this.maxLine = 1,
    this.minLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.controller,
    this.contentPadding = const EdgeInsets.fromLTRB(17, 15, 17, 15),
    Key? key,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.textStyle,
    this.hintTextStyle,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.labelStyle,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Column(
          children: [
            TextFormField(
              onFieldSubmitted: onFieldSubmitted,
              controller: controller,
              textCapitalization: textCapitalization,
              initialValue: initialValue,
              inputFormatters: textInputFormatterList,
              maxLength: maxLength,
              focusNode: focusNode,
              onTap: onTap,
              obscureText: obscureText,
              textAlign: textAlign,
              style: textStyle ?? CustomTextStyle.lightComponentInputText,
              readOnly: readOnly,
              maxLines: maxLine,
              minLines: minLines,
              decoration: InputDecoration(
                  errorStyle:
                      TextStyle(color: errorColor, fontWeight: FontWeight.w400),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor)),
                  isDense: true,
                  contentPadding: contentPadding,
                  prefixIcon: prefixIcon,
                  floatingLabelBehavior: floatingLabelBehavior,
                  filled: fillColor != null ? true : false,
                  fillColor: fillColor,
                  border: inputBorder,
                  labelText: labelText,
                  suffixIcon: suffixIcon,
                  labelStyle:
                      labelStyle ?? CustomTextStyle.lightComponentInputLabel,
                  counterText: '',
                  hintText: hintText,
                  hintStyle: hintTextStyle,
                  prefixText: prefixText.isEmpty ? null : '$prefixText  ',
                  suffixText: suffixText.isEmpty ? null : '$suffixText  ',
                  enabledBorder: enabledBorder,
                  disabledBorder: disabledBorder,
                  focusedBorder: focusedBorder,
                  errorText: errorText.isEmpty ? null : errorText),
              onChanged: onChanged,
              keyboardType: textInputType,
            ),
          ],
        ),
      );
}
