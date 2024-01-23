import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';

extension DialogExt on String {
  void succeedBar(BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      icon: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.check, color: CustomColors.lightPrimaryMain)),
      backgroundColor: CustomColors.lightSecondaryMain,
      shouldIconPulse: false,
      message: this,
      duration: const Duration(seconds: 3),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          )),
      borderRadius: BorderRadius.circular(50),
    ).show(context);
  }

  void failedBar(BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      icon: Container(
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: const Icon(Icons.warning, color: CustomColors.lightErrorMain)),
      backgroundColor: CustomColors.lightErrorMain,
      shouldIconPulse: false,
      message: this,
      duration: const Duration(seconds: 3),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      isDismissible: true,
      flushbarPosition: FlushbarPosition.TOP,
      mainButton: IconButton(
          onPressed: () {
            FlushbarDismissDirection.HORIZONTAL;
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          )),
      borderRadius: BorderRadius.circular(50),
    ).show(context);
  }
}
