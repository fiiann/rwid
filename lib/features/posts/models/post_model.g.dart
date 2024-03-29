// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostModelImpl _$$PostModelImplFromJson(Map<String, dynamic> json) =>
    _$PostModelImpl(
      id: json['id'] as int?,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      tag: json['tag_id'] as int?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      bookmarks: (json['bookmarks'] as List<dynamic>?)
          ?.map((e) => BookmarkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PostModelImplToJson(_$PostModelImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['title'] = instance.title;
  val['content'] = instance.content;
  val['image'] = instance.image;
  val['tag_id'] = instance.tag;
  val['user_id'] = instance.userId;
  return val;
}
