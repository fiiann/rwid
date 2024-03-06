import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rwid/core/config/router.dart';
import 'package:rwid/core/constant/colors.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/domain/model/user_rwid.dart';
import 'package:rwid/core/extention/bottom_sheet_ext.dart';
import 'package:rwid/core/extention/context_ext.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/profile/bloc/profile_bloc.dart';

class EditProfilePage extends StatelessWidget {
  static const String routePath = 'edit_profile';
  static const String routeName = '${DashboardPage.routeName}/$routePath';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final box = Hive.box(authBoxName);
    final UserRWID user = box.get('user');
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Edit Profile'),
      ),
      bottomNavigationBar: buttonEdit(formKey),
      body: buildForm(formKey, user),
    );
  }

  Padding buttonEdit(GlobalKey<FormBuilderState> formKey) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listenWhen: (previous, current) =>
              previous.stateSubmit.state != current.stateSubmit.state,
          listener: (context, state) async {
            ResponseState? responseState = state.stateSubmit.state;
            if (responseState == ResponseState.error ||
                responseState == ResponseState.ok) {
              final result = await context.showResultDialog(
                  status: responseState,
                  message: responseState == ResponseState.ok
                      ? 'Successfully edit data'
                      : 'Failed edit data');
              if (result != null && result) {
                if (responseState == ResponseState.ok) {
                  if (state.stateSubmit.data != null) {
                    saveUserLocal(state.stateSubmit.data!);
                    if (context.mounted) {
                      context.pop(true);
                    }
                  }
                }
              }
            }
          },
          buildWhen: (previous, current) =>
              previous.stateSubmit.state != current.stateSubmit.state,
          builder: (context, state) {
            return PrimaryButton(
              label: 'EDIT',
              onTap: () {
                submit(formKey, context);
              },
              isLoading: state.stateSubmit.state == ResponseState.loading,
            );
          },
        ),
      ),
    );
  }

  FormBuilder buildForm(GlobalKey<FormBuilderState> formKey, UserRWID user) {
    return FormBuilder(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ColorBlendedImage(
                imageUrl: user.photo,
                blendColor: Colors.blueGrey,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            title: 'Email',
            name: 'email',
            labelText: 'Email',
            value: user.email,
            enabled: false,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomText(
            'You cannot change email',
            style: CustomTextStyle.lightTypographyCaption
                .copyWith(color: CustomColors.lightErrorMain),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            title: 'Name',
            name: 'name',
            labelText: 'Name',
            value: user.name,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            title: 'Address',
            name: 'address',
            labelText: 'Address',
            value: user.address,
            maxLines: 4,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            title: 'Phone',
            name: 'phone',
            labelText: 'Phone',
            value: user.phone,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Future<void> submit(
      GlobalKey<FormBuilderState> formKey, BuildContext context) async {
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      return;
    }
    final confirm = await showConfirmationBottomSheet(
      context: context,
      image: 'assets/image/icon_rwid.jpg',
      title: 'Konfirmasi kirim data',
      message: 'Apakah Data yang Anda Input Sudah Benar?',
      positiveButton: 'Ya',
    );

    if (context.mounted) {
      if (confirm ?? false) {
        if (kDebugMode) {
          print('kirim');
        }

        final request = UserRWID.fromForm(formKey);
        if (context.mounted) {
          context.read<ProfileBloc>().add(SubmitProfile(user: request));
        }
      }
    }
  }
}

class ColorBlendedImage extends StatelessWidget {
  final String imageUrl;
  final Color blendColor;

  const ColorBlendedImage({
    super.key,
    required this.imageUrl,
    required this.blendColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(imageUrl)),
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(imageUrl, color: blendColor.withOpacity(0.5)),
        ),
        const Icon(
          Icons.add_a_photo,
          color: CustomColors.black,
        )
      ],
    );
  }
}
