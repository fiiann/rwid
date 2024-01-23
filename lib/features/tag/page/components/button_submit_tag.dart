import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/extention/string_ext.dart';
import 'package:rwid/core/widget/primary_button.dart';
import 'package:rwid/features/dashboard/dashboard_page.dart';
import 'package:rwid/features/tag/bloc/tab_cubit.dart';

class ButtonSubmitTag extends StatelessWidget {
  const ButtonSubmitTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocConsumer<TagCubit, TagState>(
        listenWhen: (previous, current) =>
            previous.stateSubmit != current.stateSubmit,
        listener: (context, state) {
          if (state.stateSubmit?.state == ResponseState.ok) {
            print('sukses');
            context.go(DashboardPage.route);
          } else if (state.stateSubmit?.state == ResponseState.error) {
            "Gagal Submit".failedBar(context);
          }
        },
        buildWhen: (previous, current) =>
            previous.stateSubmit != current.stateSubmit ||
            previous.choosedTag != current.choosedTag,
        builder: (context, state) {
          return PrimaryButton(
            disabled: state.choosedTag.isEmpty,
            isLoading: state.stateSubmit?.state == ResponseState.loading,
            label: 'SUBMIT',
            onTap: () {
              if (kDebugMode) {
                print('submit');
              }
              print(state.choosedTag);
              context.read<TagCubit>().insertTag(state.choosedTag);
            },
          );
        },
      ),
    );
  }
}
