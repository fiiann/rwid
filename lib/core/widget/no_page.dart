import 'package:flutter/material.dart';

class NoPageFound extends StatelessWidget {
  const NoPageFound({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}