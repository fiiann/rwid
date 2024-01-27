import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/widget/error_widget.dart';
import 'package:rwid/core/widget/loading_list_widget.dart';
import 'package:rwid/core/widget/no_data_widget.dart';
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
            state.listPosts.isNotEmpty) {
          return ListView.builder(
              itemCount: state.listPosts.length,
              itemBuilder: (context, index) {
                PostModel post = state.listPosts[index];
                return ListTile(
                  title: Text(post.title),
                );
              });
        }
        if (state.stateList?.state == ResponseState.ok &&
            state.listPosts.isEmpty) {
          return const NoDataListWidget();
        } else if (state.stateList == null ||
            state.stateList?.state == ResponseState.loading) {
          return const CustomLoading();
        } else {
          return const ErrorListWidget(errorMessage: 'Error');
        }
      },
    ));
  }
}