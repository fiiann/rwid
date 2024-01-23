import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/loading_list_widget.dart';

enum ButtonPrimaryType {
  solidPrimary,
  solidWarning,
  solidSuccess,
  solidFailed,
  outlinedPrimary,
  outlinedFailed,
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final bool disabled;
  final ButtonPrimaryType buttonPrimaryType;
  final FontStyle fontStyle;
  final VoidCallback onTap;
  final bool expandableHeight;
  final Widget? prefixWidget;
  final bool isLoading;

  PrimaryButton(
      {required this.label,
      this.buttonPrimaryType = ButtonPrimaryType.solidPrimary,
      this.disabled = false,
      required this.onTap,
      this.fontStyle = FontStyle.italic,
      this.expandableHeight = false,
      this.prefixWidget,
      this.isLoading = false,
      super.key});

  final ButtonStyle _defaultButtonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size(42, 100),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ));

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled || isLoading,
      child: SizedBox(
        height: expandableHeight ? null : 42,
        child: ElevatedButton(
          style: _getDefaultButtonStyle.$1,
          onPressed: () {
            if (!disabled) {
              FocusManager.instance.primaryFocus?.unfocus();
              onTap();
            }
          },
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CustomLoading(
                    color: CustomColors.white,
                  ))
              : prefixWidget == null
                  ? buttonLabel
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [prefixWidget!, buttonLabel],
                    ),
        ),
      ),
    );
  }

  Widget get buttonLabel => CustomText(
        label,
        style: CustomTextStyle.lightComponentsButtonLarge
            .copyWith(color: _getDefaultButtonStyle.$2),
      );

  (ButtonStyle, Color) get _getDefaultButtonStyle {
    switch (buttonPrimaryType) {
      case ButtonPrimaryType.solidPrimary:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.lightPrimaryMain,
                  CustomColors.lightPrimaryMain.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidWarning:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.lightWarningMain,
                  CustomColors.lightWarningMain.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidFailed:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.lightErrorMain,
                  CustomColors.lightErrorMain.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.solidSuccess:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.lightSuccessMain,
                  CustomColors.lightSuccessMain.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                Colors.transparent,
                Colors.transparent,
              )),
          CustomColors.white
        );
      case ButtonPrimaryType.outlinedPrimary:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                CustomColors.lightPrimaryMain,
                CustomColors.lightPrimaryMain.withOpacity(0.9),
              )),
          CustomColors.lightPrimaryMain
        );
      case ButtonPrimaryType.outlinedFailed:
        return (
          _defaultButtonStyle.copyWith(
              minimumSize: _getButtonMinimumSize,
              backgroundColor: _getColor(
                  disabled ? CustomColors.gray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              foregroundColor: _getColor(
                  disabled ? CustomColors.darkGray : CustomColors.white,
                  CustomColors.white.withOpacity(0.9)),
              shape: _getBorder(
                CustomColors.lightErrorMain,
                CustomColors.lightErrorMain.withOpacity(0.9),
              )),
          CustomColors.lightErrorMain
        );
    }
  }

  MaterialStateProperty<Color> _getColor(Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPressed;
      } else {
        return color;
      }
    });
  }

  MaterialStateProperty<OutlinedBorder> _getBorder(
      Color color, Color colorPressed) {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            6,
          ),
          side: BorderSide(
              width: 1.5,
              color: states.contains(MaterialState.pressed)
                  ? colorPressed
                  : color));
    });
  }

  MaterialStateProperty<Size?> get _getButtonMinimumSize {
    return MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      return const Size.fromWidth(double.infinity);
    });
  }
}
