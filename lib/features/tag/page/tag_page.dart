import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/features/tag/bloc/tab_cubit.dart';
import 'package:rwid/features/tag/page/tag_list.dart';

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
                  previous.data?.state != current.data?.state,
              builder: (context, state) {
                final response = state.data;
                if (response?.state == ResponseState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (response?.state == ResponseState.error) {
                  return Center(
                    child: Text('Error : ${response?.message ?? 'N/A'}'),
                  );
                } else {
                  if (response?.data != null && response!.data!.isNotEmpty) {
                    return TagList(tags: response.data!);
                  } else {
                    return const Center(
                      child: Text('No Data Tag'),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
