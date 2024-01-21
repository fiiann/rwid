import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/button_icon_widget.dart';
import 'package:rwid/core/widget/button_widget.dart';
import 'package:rwid/core/widget/form_input_password_widget.dart';
import 'package:rwid/core/widget/form_input_widget.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormInput(
              hint: 'Enter your email',
              label: 'Email',
              onChanged: (val) {
                context.read<AuthCubit>().changeEmail(val);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FormInputPassword(
              hint: 'Masukkan password',
              label: 'Password',
              onChanged: (val) => context.read<AuthCubit>().changePassword(val),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              // buildWhen: (previous, current) =>
              //     previous.statusLoginEmail != current.statusLoginEmail,
              builder: (context, state) {
                print(state);
                return FormButton(
                  label: state.statusLoginEmail == ProgressStatus.loading
                      ? 'Loading'
                      : 'Login',
                  onPressed: state.statusLoginEmail == ProgressStatus.loading
                      ? null
                      : () {
                          if (state.email != null && state.email!.isNotEmpty) {
                            context.read<AuthCubit>().registerEmail();
                          } else {
                            print(state.email);
                          }
                        },
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  previous.statusLoginGoogle != current.statusLoginGoogle,
              listener: (context, state) {
                if (state.statusLoginGoogle == ProgressStatus.success ||
                    state.statusLoginEmail == ProgressStatus.success) {
                  context.go(DashboardPage.route);
                } else if (state.statusLoginGoogle == ProgressStatus.failed) {
                  'Gagal Login'.failedBar(context);
                }
              },
              buildWhen: (previous, current) =>
                  previous.statusLoginGoogle != current.statusLoginGoogle,
              builder: (context, state) {
                return FormButtonIcon(
                    label: state.statusLoginGoogle == ProgressStatus.loading
                        ? 'Loading'
                        : 'Login with Google',
                    onPressed: state.statusLoginGoogle == ProgressStatus.loading
                        ? null
                        : () {
                            context.read<AuthCubit>().loginGoogle();
                          },
                    image: Image.asset('assets/icon/google.png'));
              },
            )
          ],
        ),
      ),
    );
  }
}
