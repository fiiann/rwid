import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';

class CustomLoading extends StatelessWidget {
  final EdgeInsets padding;
  final Color color;

  const CustomLoading(
      {this.padding = EdgeInsets.zero,
      this.color = CustomColors.lightPrimaryMain,
      super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: Center(child: CircularProgressIndicator(color: color)),
      );
}
