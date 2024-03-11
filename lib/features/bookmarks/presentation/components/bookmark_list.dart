import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/features/bookmarks/bloc/list_bookmark_bloc.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_card.dart';
import 'package:rwid/features/posts/list_posts/presentation/components/post_loading_card.dart';

class BookmardkList extends StatefulWidget {
  const BookmardkList({super.key});

  @override
  State<BookmardkList> createState() => _BookmardkListState();
}

class _BookmardkListState extends State<BookmardkList> {
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
      context.read<ListBookmarkBloc>().add(const BookmarkPostFetched());
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
    return BlocBuilder<ListBookmarkBloc, ListBookmarkState>(
      builder: (context, state) {
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
                  page: PageEnum.bookmark,
                  index: index,
                );
              }
            });
      },
    );
  }
}
