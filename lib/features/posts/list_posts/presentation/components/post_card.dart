import 'package:flutter/material.dart';
import 'package:rwid/core/constant/custom_text_style.dart';
import 'package:rwid/core/widget/custom_text.dart';
import 'package:rwid/features/posts/models/post_model.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomText(
                    post.title,
                    ellipsis: true,
                    style: CustomTextStyle.body1SemiBold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: post.image != null
                        ? SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.network(
                              post.image ?? '',
                              fit: BoxFit.fill,
                            ))
                        : const Icon(
                            Icons.image,
                            size: 40,
                          ),
                  ),
                )
              ],
            ),
            const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.bookmark_rounded))
          ],
        ),
      ),
    );
  }
}
