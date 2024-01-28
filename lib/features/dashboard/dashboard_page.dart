import 'package:flutter/material.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/features/dashboard/utils/dashboard_utils.dart';

class DashboardPage extends StatefulWidget {
  static const String routePath = 'dashboard';
  static const String routeName = '/$routePath';

  const DashboardPage({Key? key}) : super(key: key);

  static DashboardPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<DashboardPageState>();
  }

  @override
  State<DashboardPage> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final pageController = PageController();

  void jumpToPage(int page) => pageController.jumpToPage(page);

  @override
  Widget build(BuildContext context) {
    final pages = pagesDashboard;

    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if (didPop) {
          return;
        }
        showBackDialog(context);
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: pages.map((e) => e.$1).toList(),
        ),
        bottomNavigationBar: buildBottomNavigationBar(pages),
      ),
    );
  }

  Widget buildBottomNavigationBar(List<(Widget, String, Icon, Icon)> pages) {
    return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return NavigationBar(
            backgroundColor: Colors.white,
            elevation: 3,
            destinations: pages
                .map((e) => NavigationDestination(
                      icon: e.$3,
                      selectedIcon: e.$4,
                      label: e.$2,
                    ))
                .toList(),
            height: 60,
            surfaceTintColor: CustomColors.lightPrimaryMain,
            selectedIndex: pageController.page?.toInt() ?? 0,
            onDestinationSelected: pageController.jumpToPage,
          );
        });
  }
}
