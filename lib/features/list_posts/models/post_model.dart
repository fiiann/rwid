import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

List<PostModel> parsePostListFromMap(List<Map<String, dynamic>> mapData) {
  return mapData.map((map) => PostModel.fromMap(map)).toList();
}

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    int? id,
    required String title,
    required String content,
    int? tag,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  factory PostModel.fromMap(Map<String, dynamic> map) =>
      _$PostModelFromJson(map);
}
