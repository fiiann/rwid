import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/button_icon_widget.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.status == ProgressStatus.success) {
                  context.push(DashboardPage.route);
                } else if (state.status == ProgressStatus.failed) {
                  'Gagal Login'.failedBar(context);
                }
              },
              builder: (context, state) {
                return FormButtonIcon(
                    label: state.status == ProgressStatus.loading
                        ? 'Loading'
                        : 'Login with Google',
                    onPressed: state.status == ProgressStatus.loading
                        ? null
                        : () {
                            context.read<AuthCubit>().loginGoogle();
                          },
                    image: Image.asset('assets/icon/google.png'));
              },
            ),
          )
        ],
      ),
    );
  }
}
