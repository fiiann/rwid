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
              listenWhen: (previous, current) =>
                  previous.statusLogin != current.statusLogin,
              listener: (context, state) {
                if (state.statusLogin == ProgressStatus.success) {
                  context.go(DashboardPage.route);
                } else if (state.statusLogin == ProgressStatus.failed) {
                  'Gagal Login'.failedBar(context);
                }
              },
              buildWhen: (previous, current) =>
                  previous.statusLogin != current.statusLogin,
              builder: (context, state) {
                return FormButtonIcon(
                    label: state.statusLogin == ProgressStatus.loading
                        ? 'Loading'
                        : 'Login with Google',
                    onPressed: state.statusLogin == ProgressStatus.loading
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
