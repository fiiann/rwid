import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/form_input_password_widget.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/list_posts/presentation/list_post_page.dart';
import 'package:rwid/features/tag/page/tag_page.dart';

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
            CustomTextField(
              hintText: 'Enter your email',
              labelText: 'Email',
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
              buildWhen: (previous, current) =>
                  previous.statusLoginEmail?.state !=
                  current.statusLoginEmail?.state,
              builder: (context, state) {
                return PrimaryButton(
                    label:
                        state.statusLoginEmail?.state == ResponseState.loading
                            ? 'Loading'
                            : 'Login',
                    onTap: () {
                      if (state.email != null && state.email!.isNotEmpty) {
                        context.read<AuthCubit>().registerEmail();
                      } else {
                        if (kDebugMode) {
                          print(state.email);
                        }
                      }
                    });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  previous.statusLoginGoogle?.state !=
                  current.statusLoginGoogle?.state,
              listener: (context, state) {
                if (state.statusLoginGoogle?.state == ResponseState.ok ||
                    state.statusLoginEmail?.state == ResponseState.ok) {
                  //TODO CHECK IS USER HAVE TAGS
                  if (state.authenticationStatus ==
                      AuthenticationStatus.authenticatedWithTags) {
                    //TODO CHANGE TO DASHBOARD
                    context.go(ListPostPage.route);
                  } else {
                    context.go(TagPage.route);
                  }
                } else if (state.statusLoginGoogle?.state ==
                    ResponseState.error) {
                  'Gagal Login'.failedBar(context);
                }
              },
              buildWhen: (previous, current) =>
                  previous.statusLoginGoogle != current.statusLoginGoogle,
              builder: (context, state) {
                return PrimaryButton(
                    label: 'Login Google',
                    onTap: () {
                      context.read<AuthCubit>().loginGoogle();
                    });
              },
            )
          ],
        ),
      ),
    );
  }
}
