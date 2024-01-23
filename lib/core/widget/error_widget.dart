import 'package:flutter/material.dart';

class ErrorListWidget extends StatelessWidget {
  const ErrorListWidget({
    super.key,
    required this.errorMessage,
  });

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error : ${errorMessage ?? 'N/A'}'),
    );
  }
}
