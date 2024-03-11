import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/enum/enum.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/bookmarks/bloc/list_bookmark_bloc.dart';
import 'package:rwid/features/posts/detail_post/presentation/post_detail_page.dart';
import 'package:rwid/features/posts/list_posts/bloc/list_post_bloc.dart';
import 'package:rwid/features/posts/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard(
      {super.key, required this.post, required this.page, required this.index});
  final PostModel post;
  final PageEnum page;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        toDetail(context);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _mainInfoPost(),
                  _imagePost(),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              _footerCard(post.count),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _imagePost() {
    return Expanded(
      child: Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Hero(
                  tag: post.id ?? DateTime.now(),
                  child: Image.network(
                    post.image == null ? '' : post.image ?? noImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ))),
    );
  }

  Expanded _mainInfoPost() {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            post.title,
            ellipsis: true,
            maxLines: 2,
            style: CustomTextStyle.body1SemiBold,
          ),
          CustomText(
            post.content,
            ellipsis: true,
            style: CustomTextStyle.body2,
          ),
        ],
      ),
    );
  }

  Widget _footerCard(int countView) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          post.formatCreatedAt,
          style: CustomTextStyle.lightTypographyCaption,
        ),
        Row(
          children: [
            CustomText('$countView'),
            bookmarkWidget(page),
          ],
        )
      ],
    );
  }

  Widget bookmarkWidget(PageEnum page) {
    if (page == PageEnum.dashboard) {
      return BlocBuilder<ListPostBloc, ListPostState>(
        buildWhen: (previous, current) =>
            previous.listPosts != current.listPosts,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => context
                .read<ListPostBloc>()
                .add(ToggleBookmarkPostChanged(idPost: post.id ?? 0)),
            child: Icon(
              !post.isBookmark
                  ? Icons.bookmark_outline_rounded
                  : Icons.bookmark,
              size: 16,
            ),
          );
        },
      );
    } else {
      return BlocBuilder<ListBookmarkBloc, ListBookmarkState>(
        buildWhen: (previous, current) =>
            previous.listPosts != current.listPosts,
        builder: (context, state) {
          return GestureDetector(
            onTap: () => context
                .read<ListBookmarkBloc>()
                .add(ToggleBookmarkChanged(idPost: post.id ?? 0)),
            child: Icon(
              !post.isBookmark
                  ? Icons.bookmark_outline_rounded
                  : Icons.bookmark,
              size: 16,
            ),
          );
        },
      );
    }
  }

  void toDetail(BuildContext context) async {
    final detail = await context.push(PostDetailPage.routeName, extra: post.id);
    if (detail != null && detail is bool) {
      if (detail) {
        if (context.mounted) {
          //TODO IN FUTURE NO CALL API, JUST UPDATE LOCAL STATE
          // print(detail);
          // var posts = context.read<ListPostBloc>().state.listPosts;
          // var post = posts[index].copyWith(count: posts[index].count + 1);
          // posts[index] = post;
          // var newPost = [...posts];
          context.read<ListPostBloc>().add(const PostFetched(isRefresh: true));
          // context.read<ListPostBloc>().state.stateList.data = newPost;
        }
      }
    }
  }
}
