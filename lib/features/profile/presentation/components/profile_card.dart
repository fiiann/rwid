import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/profile/presentation/profile_utils.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.data,
  });

  final ProfileTuple data;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      onTap: data.$4,
      title: CustomText(
        data.$1,
        style: CustomTextStyle.lightTypographyBody2,
      ),
      leading: CircleAvatar(
          child: Icon(
        data.$3,
        size: 14,
      )),
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      trailing: data.$4 == null
          ? null
          : const Icon(
              Icons.arrow_forward_ios,
              color: CustomColors.lightPrimaryMain,
              size: 14,
            ),
      additionalInfo: CustomText(
        data.$2,
        style: CustomTextStyle.body2SemiBold,
      ),
    );
  }
}
