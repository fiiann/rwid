import 'package:flutter/material.dart';
import 'package:rwid/core/widget/button_icon_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FormButtonIcon(
                label: 'Login with Google',
                onPressed: () {},
                image: Image.asset('assets/icon/google.png')),
          )
        ],
      ),
    );
  }
}
