import 'package:flutter/material.dart';

class TagPage extends StatelessWidget {
  const TagPage({super.key});
  static const String route = '/tag';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Tag'),
      ),
    );
  }
}
