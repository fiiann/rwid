import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/extention/bottom_sheet_ext.dart';
import 'package:rwid/core/extention/context_ext.dart';
import 'package:rwid/core/widget/custom_dropdown.dart';
import 'package:rwid/core/widget/custom_image_picker.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/core/widget/custom_text_field.dart';
import 'package:rwid/core/widget/form_shimmer.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/posts/add_post/bloc/add_post_cubit.dart';
import 'package:rwid/features/posts/models/post_model.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

class AddPostPage extends StatefulWidget {
  static const String routePath = 'add_post_page';
  static const String routeName = '${DashboardPage.routeName}/$routePath';

  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AddPostCubit>().getListTag();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText('Add Post'),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextFormField(
                  labelText: 'Title',
                  name: 'title',
                  maxLines: 2,
                ),
                const SizedBox(height: 16.0),
                const CustomTextFormField(
                  labelText: 'Content',
                  name: 'content',
                  maxLines: 5,
                ),
                const SizedBox(height: 16.0),
                buildFormTag(),
                const SizedBox(height: 16.0),
                const CustomImagePicker(
                  name: 'image',
                ),
                const SizedBox(height: 16.0),
                buildButtonSubmit(formKey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BlocConsumer<AddPostCubit, AddPostState> buildButtonSubmit(
      GlobalKey<FormBuilderState> formKey) {
    return BlocConsumer<AddPostCubit, AddPostState>(
      listener: (context, state) async {
        ResponseState? responseState = state.stateSubmit?.state;
        if (responseState == ResponseState.error ||
            responseState == ResponseState.ok) {
          final result = await context.showResultDialog(
              status: responseState ?? ResponseState.error,
              message: responseState == ResponseState.ok
                  ? 'Successfully create post'
                  : 'Failed created post');
          if (result != null && result) {
            if (responseState == ResponseState.ok) {
              if (context.mounted) {
                context.pop(true);
              }
            }
          }
        }
      },
      listenWhen: (previous, current) =>
          previous.stateSubmit?.state != current.stateSubmit?.state,
      buildWhen: (previous, current) =>
          previous.stateSubmit?.state != current.stateSubmit?.state,
      builder: (context, state) {
        return PrimaryButton(
            label: 'SUBMIT',
            isLoading: state.stateSubmit?.state == ResponseState.loading,
            onTap: () {
              submit(formKey);
            });
      },
    );
  }

  BlocBuilder<AddPostCubit, AddPostState> buildFormTag() {
    return BlocBuilder<AddPostCubit, AddPostState>(
      buildWhen: (previous, current) =>
          previous.stateListTag?.state != current.stateListTag?.state,
      builder: (context, state) {
        if (state.stateListTag?.state == ResponseState.loading) {
          return const FormShimmerLoading();
        } else if (state.stateListTag?.state == ResponseState.ok) {
          return CustomDropdown<TagModel>(
            options: state.stateListTag?.data ?? [],
            title: 'Tag',
            name: 'tag_id',
            hintText: 'Pilih Tag',
            onChanged: (vel) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          );
        } else {
          return const Text('Error get list tag');
        }
      },
    );
  }

  Future<void> submit(GlobalKey<FormBuilderState> formKey) async {
    if (formKey.currentState != null && !formKey.currentState!.validate()) {
      // print('not validate');
      return;
    }

    // print(request);
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

        final request = PostModel.fromForm(formKey);
        final image =
            formKey.currentState?.fields['image']?.value.first as XFile;
        if (context.mounted) {
          context.read<AddPostCubit>().submitPost(request, image);
        }
      }
    }
  }
}
