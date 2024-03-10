import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rwid/features/tag/model/tag_model.dart';

part 'user_tag_model.freezed.dart';
part 'user_tag_model.g.dart';

List<UserTag> parseUserTagListFromMap(List<Map<String, dynamic>> mapData) {
  return mapData.map((map) => UserTag.fromMap(map)).toList();
}

@freezed
class UserTag with _$UserTag {
  const factory UserTag(
      {required int id,
      @JsonKey(name: 'tag_id') required int tagId,
      @JsonKey(name: 'tag') TagModel? tagModel}) = _UserTag;

  factory UserTag.fromJson(Map<String, dynamic> json) =>
      _$UserTagFromJson(json);
  factory UserTag.fromMap(Map<String, dynamic> map) => _$UserTagFromJson(map);
}
