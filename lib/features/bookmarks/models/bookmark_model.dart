import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark_model.freezed.dart';
part 'bookmark_model.g.dart';

Map<String, dynamic> parseBookmarkModelToJson(BookmarkModel model) {
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
}
