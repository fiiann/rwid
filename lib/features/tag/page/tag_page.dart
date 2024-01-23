import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/widget/error_widget.dart';
import 'package:rwid/core/widget/loading_list_widget.dart';
import 'package:rwid/core/widget/no_data_widget.dart';
import 'package:rwid/features/tag/bloc/tab_cubit.dart';
import 'package:rwid/features/tag/page/components/button_submit_tag.dart';
import 'package:rwid/features/tag/page/components/tag_list.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});
  static const String route = '/tag';

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<TagCubit>().getListTag();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Tag'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TagCubit, TagState>(
              buildWhen: (previous, current) =>
                  previous.stateList?.state != current.stateList?.state,
              builder: (context, state) {
                final response = state.stateList;
                if (response?.state == ResponseState.loading) {
                  return const CustomLoading();
                } else if (response?.state == ResponseState.error) {
                  return ErrorListWidget(errorMessage: response?.message);
                } else {
                  if (response?.data != null && response!.data!.isNotEmpty) {
                    return const TagList();
                  } else {
                    return const NoDataListWidget();
                  }
                }
              },
            ),
          ),
          const ButtonSubmitTag()
        ],
      ),
    );
  }
}
