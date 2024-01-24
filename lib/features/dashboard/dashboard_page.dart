import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/auth/page/login_page.dart';

class DashboardPage extends StatelessWidget {
  static const String route = '/dashboard';

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) =>
          previous.statusLogout?.state != current.statusLogout?.state,
      listener: (_, state) {
        if (state.statusLogout?.state == ResponseState.ok) {
          context.go(LoginPage.route);
        } else if (state.statusLogout?.state == ResponseState.error) {
          (state.statusLogout?.message ?? 'Error').failedBar(context);
        }
      },
      buildWhen: (previous, current) =>
          previous.statusLogout != current.statusLogout,
      builder: (context, state) {
        final box = Hive.box(authBoxName);
        final user = box.get('user');
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
                  child: state.statusLogout?.state == ResponseState.loading
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
                  child: PrimaryButton(
                    label: state.statusLogout?.state == ResponseState.loading
                        ? 'LOADING'
                        : 'LOGOUT',
                    onTap: () {
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
