import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/config/date_utility.dart';
import 'package:rwid/features/bookmarks/models/bookmark_model.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

List<PostModel> parsePostListFromJson(List<Map<String, dynamic>> mapData) {
  return mapData.map((map) {
    final post = PostModel.fromJson(map);
    return post.copyWith(isBookmark: map['bookmarks'].isNotEmpty);
  }).toList();
}

Map<String, dynamic> parsePostModelToJson(PostModel model) {
  return model.toJson();
}

@freezed
class PostModel with _$PostModel {
  const PostModel._();
  const factory PostModel(
      {@JsonKey(includeIfNull: false) int? id,
      required String title,
      required String content,
      String? image,
      @JsonKey(name: 'tag_id') int? tag,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'created_at', includeToJson: false) DateTime? createdAt,
      List<BookmarkModel>? bookmarks,
      @JsonKey(
          includeToJson: false, includeFromJson: true, name: 'is_bookmarked')
      @Default(false)
      bool isBookmark}) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  factory PostModel.fromForm(GlobalKey<FormBuilderState> formKey) {
    final title = formKey.currentState?.fields['title']!.value as String;
    final content = formKey.currentState?.fields['content']!.value as String;
    final tagId = formKey.currentState?.fields['tag_id']!.value as TagModel;
    return PostModel(title: title, content: content, tag: tagId.id);
  }

  String get formatCreatedAt => formatDateTimeAsString(createdAt);
}
