import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rwid/core/constant/constant.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/posts/detail_post/presentation/post_detail_page.dart';
import 'package:rwid/features/posts/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(PostDetailPage.routeName, extra: post.id);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
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
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                            height: 60,
                            width: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                post.image == null ? '' : post.image ?? noImage,
                                fit: BoxFit.fill,
                              ),
                            ))),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    post.formatCreatedAt,
                    style: CustomTextStyle.lightTypographyCaption,
                  ),
                  const Icon(
                    Icons.bookmark_outline_rounded,
                    size: 16,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
