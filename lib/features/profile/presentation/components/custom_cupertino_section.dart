import 'package:flutter/cupertino.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/profile/presentation/components/profile_card.dart';
import 'package:rwid/features/profile/presentation/profile_utils.dart';

class CustomCupertinoSection extends StatelessWidget {
  const CustomCupertinoSection(
      {super.key, required this.data, required this.title, this.edit});

  final List<ProfileTuple> data;
  final String title;
  final Widget? edit;
  @override
  Widget build(BuildContext context) {
    return CupertinoListSection.insetGrouped(
      backgroundColor: CupertinoColors.white,
      header: edit == null
          ? title == ''
              ? null
              : CustomText(title)
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [CustomText(title), edit!],
            ),
      separatorColor: CupertinoColors.extraLightBackgroundGray,
      children: data
          .map((e) => ProfileCard(
                data: e,
              ))
          .toList(),
    );
  }
}
