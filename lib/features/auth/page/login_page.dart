import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/auth/bloc/auth_cubit.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/tag/page/tag_page.dart';

class LoginPage extends StatelessWidget {
  static const String route = '/login';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomText(
          'By Signing Up, you agree to Articelly Term of Service and Privacy Policy',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              CustomText(
                'Welcome to Articelly',
                style: CustomTextStyle.body1SemiBold.copyWith(fontSize: 26),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Image.asset('assets/image/icon_apps.png')),
              const SizedBox(
                height: 100,
              ),
              const CustomTextFormField(
                labelText: 'Username',
                name: 'username',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                name: 'Masukkan password',
                labelText: 'Password',
                onChange: (val) =>
                    context.read<AuthCubit>().changePassword(val),
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
                        'Feature sedang di develop'.failedBar(context);
                        /*if (state.email != null && state.email!.isNotEmpty) {
                          context.read<AuthCubit>().registerEmail();

                        } else {
                          if (kDebugMode) {
                            print(state.email);
                          }
                        }*/
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
                      context.go(DashboardPage.routeName);
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
                      prefixWidget: Image.asset(
                        'assets/icon/google.png', // Replace with your Google logo asset path
                        height: 24,
                      ),
                      buttonPrimaryType: ButtonPrimaryType.outlinedPrimary,
                      label: 'Login Google',
                      onTap: () {
                        context.read<AuthCubit>().loginGoogle();
                      });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
