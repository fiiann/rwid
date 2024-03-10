import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/widget/custom_text.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.listTab,
    this.isScrollable = true,
    this.tabAlignment,
    this.paddingTabBar,
    this.labelPaddingTabBar,
  });

  //THE THIS IS YOUR ENUM TAB LIST
  final List<String> listTab;
  final bool isScrollable;
  final TabAlignment? tabAlignment;
  final EdgeInsets? paddingTabBar;
  final EdgeInsets? labelPaddingTabBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1.0, color: CustomColors.lightGreyGrey),
        ),
      ),
      child: _tabBar(),
    );
  }

  TabBar _tabBar() {
    Color activeColor = CustomColors.lightPrimaryMain;
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: tabAlignment,
        isScrollable: isScrollable,
        labelColor: activeColor,
        unselectedLabelColor: CustomColors.lightGreyGrey,
        indicatorColor: activeColor,
        padding: paddingTabBar ?? const EdgeInsets.fromLTRB(12, 12, 12, 0),
        labelPadding: labelPaddingTabBar ?? const EdgeInsets.all(8),
        tabs: listTab.map((e) => CustomText(e)).toList());
  }
}
