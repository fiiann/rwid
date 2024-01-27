import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/widget/no_page.dart';
import 'package:rwid/features/posts/list_posts/presentation/list_post_page.dart';

final List<(Widget, String, Icon, Icon)> pagesDashboard = [
  (
    const ListPostPage(),
    'Dashboard',
    const Icon(Icons.space_dashboard_outlined),
    const Icon(Icons.space_dashboard)
  ),
  (
    const NoPageFound(title: 'Bookmark'),
    'Bookmark',
    const Icon(Icons.bookmark_outline_rounded),
    const Icon(Icons.bookmark_rounded)
  ),
  (
    const NoPageFound(title: 'Profile'),
    'Profile',
    const Icon(Icons.account_circle_outlined),
    const Icon(Icons.account_circle)
  ),
];

Future<bool> onWillPop(PageController pageController) async {
  if (pageController.page?.toInt() == 0) {
    return true;
  }

  pageController.jumpToPage(0);
  return false;
}

void showBackDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'Are you sure you want to leave this page?',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Nevermind'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Leave'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      );
    },
  );
}
