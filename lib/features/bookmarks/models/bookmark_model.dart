import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';
part 'bookmark_model.g.dart';

Map<String, dynamic> parseBookmarkModelToMap(BookmarkModel model) {
  return model.toJson();
}

@freezed
class BookmarkModel with _$BookmarkModel {
  const factory BookmarkModel({
    @JsonKey(includeToJson: false) int? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'post_id') int? postId,
  }) = _BookmarkModel;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkModelFromJson(json);
  factory BookmarkModel.fromMap(Map<String, dynamic> map) =>
      _$BookmarkModelFromJson(map);
}
