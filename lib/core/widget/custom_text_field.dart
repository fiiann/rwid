import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/constant/text_form_field_style.dart';
import 'package:rwid/core/widget/custom_text.dart';

class CustomTextField extends StatefulWidget {
  final TextCapitalization textCapitalization;
  final String initialValue;
  final List<TextInputFormatter>? textInputFormatterList;
  final int? maxLine;
  final String? labelText;
  final Widget? labelWidget;
  final String hintText;
  final String errorText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool readOnly;
  final double textFieldHeight;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function()? onTap;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FloatingLabelBehavior floatingLabelBehavior;
  final InputBorder? border;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? errorStyle;
  final InputBorder? errorBorder;

  const CustomTextField(
      {super.key,
      this.onChanged,
      this.onFieldSubmitted,
      this.onTap,
      this.textCapitalization = TextCapitalization.none,
      this.floatingLabelBehavior = FloatingLabelBehavior.never,
      this.initialValue = '',
      this.textInputFormatterList,
      this.labelText = '',
      this.hintText = '',
      this.errorText = '',
      this.textInputAction,
      this.textInputType,
      this.prefix,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.enabled = true,
      this.readOnly = false,
      this.textFieldHeight = 40,
      this.maxLine,
      this.border,
      this.validator,
      this.labelWidget,
      this.errorStyle = const TextStyle(color: CustomColors.red, fontSize: 12),
      this.errorBorder = const OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.red))});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController controller = TextEditingController();
  late FloatingLabelBehavior floatingLabelBehavior;
  String? label;

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue;
    if (widget.floatingLabelBehavior == FloatingLabelBehavior.always) {
      label = widget.labelText;
      floatingLabelBehavior = widget.floatingLabelBehavior;
    } else {
      floatingLabelBehavior = FloatingLabelBehavior.never;
      if (widget.initialValue.isNotEmpty) {
        label = widget.labelText;
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
      controller.addListener(() {
        _setFloatingLabelBehavior();
      });
    }
  }

  void _setFloatingLabelBehavior() {
    setState(() {
      if (controller.text.isEmpty) {
        label = null;
        floatingLabelBehavior = FloatingLabelBehavior.never;
      } else {
        label = widget.labelText;
        floatingLabelBehavior = FloatingLabelBehavior.always;
      }
    });
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.textFieldHeight,
            child: TextFormField(
                onFieldSubmitted: widget.onFieldSubmitted,
                controller: widget.controller ?? controller,
                enabled: widget.enabled,
                onChanged: widget.onChanged,
                readOnly: widget.readOnly,
                onTap: widget.onTap,
                keyboardType: widget.textInputType,
                textCapitalization: widget.textCapitalization,
                inputFormatters: widget.textInputFormatterList,
                maxLines: widget.maxLine,
                textInputAction: widget.textInputAction,
                validator: widget.validator,
                style: TextFieldStyle.valueTextStyle,
                decoration: TextFieldStyle.inputDecoration.copyWith(
                  border: widget.border,
                  prefix: widget.prefix,
                  prefixIcon: widget.prefixIcon,
                  floatingLabelBehavior: floatingLabelBehavior,
                  floatingLabelStyle: CustomTextStyle.lightComponentInputLabel,
                  labelText: label,
                  label: widget.labelWidget,
                  errorBorder: widget.errorBorder,
                  errorStyle: widget.errorStyle,
                  hintText: widget.hintText,
                  suffixIcon: widget.suffixIcon,
                )),
          ),
          if (widget.errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 2, top: 5),
              child: CustomText(
                widget.errorText,
                style: CustomTextStyle.lightTypographyCaption
                    .copyWith(color: CustomColors.red),
              ),
            )
        ],
      );
}
