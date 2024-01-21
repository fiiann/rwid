import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/button_widget.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/auth/page/login_page.dart';

class DashboardPage extends StatelessWidget {
  static const String route = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.statusLogout != current.statusLogout,
      listener: (_, state) {
        if (state.statusLogout == ProgressStatus.success) {
          context.go(LoginPage.route);
        } else if (state.statusLoginGoogle == ProgressStatus.failed) {
          state.errorMessage ?? 'Error'.failedBar(context);
        }
      },
      buildWhen: (previous, current) =>
          previous.statusLogout != current.statusLogout,
      builder: (context, state) {
        final user = state.userRwid;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Welcome, ${user.name} !',
              overflow: TextOverflow.ellipsis,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onDoubleTap: () => context.read<AuthCubit>().logout(),
                  child: state.statusLogout == ProgressStatus.loading
                      ? const SizedBox.square(
                          dimension: 16,
                          child: CircularProgressIndicator(),
                        )
                      : CircleAvatar(
                          foregroundImage: NetworkImage(user.photo),
                        ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // CircleAvatar(
                //   foregroundImage: NetworkImage(user.identities.first.id),
                // ),
                Text(user.name),
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  foregroundImage: NetworkImage(user.photo),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: FormButton(
                    label: state.statusLogout == ProgressStatus.loading
                        ? 'LOADING'
                        : 'LOGOUT',
                    onPressed: state.statusLogout == ProgressStatus.loading
                        ? null
                        : () {
                            context.read<AuthCubit>().logout();
                          },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
