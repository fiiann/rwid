import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_model.freezed.dart';
part 'tag_model.g.dart';

List<TagModel> parseTagModelsListFromMap(List<Map<String, dynamic>> mapData) {
  return mapData.map((map) => TagModel.fromMap(map)).toList();
}

@freezed
class TagModel with _$TagModel {
  const factory TagModel(
      {required int id, required String name, DateTime? createdAt}) = _TagModel;

  factory TagModel.fromJson(Map<String, dynamic> json) =>
      _$TagModelFromJson(json);

  factory TagModel.fromMap(Map<String, dynamic> map) => _$TagModelFromJson(map);
}
