// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tag_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTagImpl _$$UserTagImplFromJson(Map<String, dynamic> json) =>
    _$UserTagImpl(
      id: json['id'] as int,
      tagId: json['tag_id'] as int,
      tagModel: json['tag'] == null
          ? null
          : TagModel.fromJson(json['tag'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserTagImplToJson(_$UserTagImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tag_id': instance.tagId,
      'tag': instance.tagModel?.toJson(),
    };
