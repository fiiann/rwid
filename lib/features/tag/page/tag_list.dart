import 'package:flutter/material.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

class TagList extends StatelessWidget {
  const TagList({super.key, required this.tags});
  final List<TagModel?> tags;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tags[index]?.name ?? '-'),
          );
        });
  }
}
