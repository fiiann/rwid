import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/features/auth/model/user_tag_model.dart';
import 'package:rwid/features/posts/list_posts/bloc/list_post_bloc.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_card.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_loading_card.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.tag});
  final UserTag tag;
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ListPostBloc>().add(PostFetched(tag: widget.tag));
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
      context.read<ListPostBloc>().add(PostFetched(tag: widget.tag));
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
    return BlocBuilder<ListPostBloc, ListPostState>(
      // buildWhen: (previous, current) =>
      //     previous.hasReachMax != current.hasReachMax,
      builder: (context, state) {
        return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.hasReachMaxPost[
                        state.selectedTag?.tagModel?.name ?? ''] ??
                    false
                ? state.stateListPost[state.selectedTag?.tagModel?.name ?? '']
                    ?.data?.length
                : state.stateListPost[state.selectedTag?.tagModel?.name ?? '']
                        ?.data?.length ??
                    0 + 1,
            itemBuilder: (context, index) {
              if (index >=
                  state.stateListPost[state.selectedTag?.tagModel?.name ?? '']!
                      .data!.length) {
                return const PostLoadingCard();
              } else {
                return PostCard(
                  post: state
                      .stateListPost[state.selectedTag?.tagModel?.name ?? '']!
                      .data![index],
                  page: PageEnum.dashboard,
                  index: index,
                );
              }
            });
      },
    );
  }
}
