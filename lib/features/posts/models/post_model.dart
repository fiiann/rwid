import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/core/config/date_utility.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

List<PostModel> parsePostListFromMap(List<Map<String, dynamic>> mapData) {
  return mapData.map((map) => PostModel.fromMap(map)).toList();
}

Map<String, dynamic> parsePostModelToMap(PostModel model) {
  return model.toJson();
}

@freezed
class PostModel with _$PostModel {
  const PostModel._();
  const factory PostModel({
    @JsonKey(includeIfNull: false) int? id,
    required String title,
    required String content,
    String? image,
    @JsonKey(name: 'tag_id') int? tag,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  factory PostModel.fromMap(Map<String, dynamic> map) =>
      _$PostModelFromJson(map);

  factory PostModel.fromForm(GlobalKey<FormBuilderState> formKey) {
    final title = formKey.currentState?.fields['title']!.value as String;
    final content = formKey.currentState?.fields['content']!.value as String;
    final tagId = formKey.currentState?.fields['tag_id']!.value as TagModel;
    return PostModel(title: title, content: content, tag: tagId.id);
  }

  String get formatCreatedAt => formatDateTimeAsString(createdAt);
}
