import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/extention/validator.dart';

typedef VoidCallbackParam = void Function(String?);

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.name,
    required this.labelText,
    this.isPassword = false,
    this.isEmail = false,
    this.isRequired = true,
    this.useBorder = true,
    this.enabled = true,
    this.compact = true,
    this.textInputType = TextInputType.text,
    this.filledColor = Colors.white,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.title,
    this.value,
    this.maxLines = 1,
    super.key,
    this.radius = 30,
    this.onChange,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  });
  final String name;
  final String labelText;
  final String? title;
  final bool isPassword;
  final bool isEmail;
  final bool isRequired;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool useBorder;
  final bool enabled;
  final bool compact;
  final String? value;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Color filledColor;
  final int maxLines;
  final double radius;
  final VoidCallbackParam? onChange;
  final VoidCallbackParam? onSubmitted;

  @override
  Widget build(BuildContext context) {
    var isObscure = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title == null)
          const SizedBox.shrink()
        else
          Text(
            title!,
            style: const TextStyle(
              color: CustomColors.lightPrimaryMain,
              fontWeight: FontWeight.bold,
            ),
          ),
        if (title == null)
          const SizedBox.shrink()
        else
          const SizedBox(
            height: 10,
          ),
        StatefulBuilder(
          builder: (context, setState) {
            return FormBuilderTextField(
              name: name,
              onSubmitted: onSubmitted,
              enabled: enabled,
              initialValue: value,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              maxLines: maxLines,
              onChanged: onChange,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  vertical: !compact ? 20 : 10,
                  horizontal: 20,
                ),
                hintText: labelText,
                hintStyle:
                    const TextStyle(color: CustomColors.lightTextDisabled),
                prefix: prefix,
                prefixIcon: prefixIcon,
                disabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                enabledBorder: useBorder ? buildOutlineInputBorder() : null,
                border: !useBorder ? buildOutlineInputBorder() : null,
                suffixIcon: !isPassword
                    ? suffixIcon
                    : IconButton(
                        splashRadius: 9,
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
              ),
              obscureText: isObscure,
              validator: FormBuilderValidators.compose([
                if (isRequired) FormBuilderValidators.required(),
                if (isEmail) FormBuilderValidators.email(),
                if (isPassword)
                  (val) {
                    final password = val;
                    if (password == null) return null;
                    if (!Validator.isValidPassWord(password)) {
                      return 'Minimum 8 characters required';
                    }
                    return null;
                  },
              ]),
            );
          },
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      borderSide: useBorder
          ? const BorderSide(width: 2, color: CustomColors.lightTextDisabled)
          : BorderSide.none,
    );
  }
}

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    this.onChanged,
    this.onFieldSubmitted,
  });
  final VoidCallbackParam? onChanged;
  final VoidCallbackParam? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      name: 'search',
      labelText: 'Cari Data',
      useBorder: true,
      onChange: onChanged,
      onSubmitted: onFieldSubmitted,
      prefixIcon: const Icon(Icons.search),
    );
  }
}

class TextFormReadOnly extends StatelessWidget {
  const TextFormReadOnly({
    required this.title,
    required this.initialValue,
    this.suffixIcon = const SizedBox.shrink(),
    this.maxLine = 1,
    super.key,
  });

  final String? title;
  final String? initialValue;
  final Widget suffixIcon;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            color: CustomColors.lightPrimaryMain,
            fontWeight: FontWeight.bold,
          ),
        ),
        FormBuilderTextField(
          name: title == null
              ? 'title'
              : title!.toLowerCase().replaceAll(' ', '_'),
          enabled: false,
          maxLines: maxLine,
          initialValue: initialValue,
          textAlign: TextAlign.left,
          decoration: InputDecoration(suffixIcon: suffixIcon),
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
