import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/domain/model/base_response.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/widget/error_widget.dart';
import 'package:rwid/core/widget/no_data_widget.dart';
import 'package:rwid/features/posts/list_posts/bloc/list_post_bloc.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_card.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_loading_card.dart';

class PostList extends StatefulWidget {
  const PostList({super.key});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ListPostBloc>().add(const PostFetched());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ListPostBloc, ListPostState>(
        builder: (context, state) {
          switch (state.stateList.state) {
            case ResponseState.error:
              return const ErrorListWidget(errorMessage: 'Error');
            case ResponseState.ok:
              if (state.listPosts.isEmpty) {
                return const NoDataListWidget();
              }
              return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.hasReachMax
                      ? state.listPosts.length
                      : state.listPosts.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.listPosts.length) {
                      return const PostLoadingCard();
                    } else {
                      return PostCard(
                        post: state.listPosts[index],
                        page: PageEnum.dashboard,
                      );
                    }
                  });
            default:
              return const PostLoadingList();
          }
        },
      ),
    );
  }
}
