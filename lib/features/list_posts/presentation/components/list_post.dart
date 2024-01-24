import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/widget/loading_list_widget.dart';
import 'package:rwid/features/list_posts/bloc/posts_cubit.dart';
import 'package:rwid/features/list_posts/models/post_model.dart';

class ListPost extends StatelessWidget {
  const ListPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: BlocBuilder<PostsCubit, PostsState>(
      buildWhen: (previous, current) =>
          previous.stateList?.state != current.stateList?.state,
      builder: (context, state) {
        if (state.stateList?.state == ResponseState.ok &&
            state.stateList!.data!.isNotEmpty) {
          return ListView.builder(
              itemCount: state.stateList?.data?.length ?? 0,
              itemBuilder: (context, index) {
                PostModel post = state.stateList!.data![index];
                return ListTile(
                  title: Text(post.title),
                );
              });
        } else {
          return const CustomLoading();
        }
      },
    ));
  }
}
