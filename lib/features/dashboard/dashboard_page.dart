import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  static const String route = '/dashboard';
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('HOMe'),
          )
        ],
      ),
    );
  }
}
