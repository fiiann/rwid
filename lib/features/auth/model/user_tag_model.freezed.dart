// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserTag _$UserTagFromJson(Map<String, dynamic> json) {
  return _UserTag.fromJson(json);
}

/// @nodoc
mixin _$UserTag {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tag_id')
  int get tagId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTagCopyWith<UserTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTagCopyWith<$Res> {
  factory $UserTagCopyWith(UserTag value, $Res Function(UserTag) then) =
      _$UserTagCopyWithImpl<$Res, UserTag>;
  @useResult
  $Res call({int id, @JsonKey(name: 'tag_id') int tagId});
}

/// @nodoc
class _$UserTagCopyWithImpl<$Res, $Val extends UserTag>
    implements $UserTagCopyWith<$Res> {
  _$UserTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserTagImplCopyWith<$Res> implements $UserTagCopyWith<$Res> {
  factory _$$UserTagImplCopyWith(
          _$UserTagImpl value, $Res Function(_$UserTagImpl) then) =
      __$$UserTagImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, @JsonKey(name: 'tag_id') int tagId});
}

/// @nodoc
class __$$UserTagImplCopyWithImpl<$Res>
    extends _$UserTagCopyWithImpl<$Res, _$UserTagImpl>
    implements _$$UserTagImplCopyWith<$Res> {
  __$$UserTagImplCopyWithImpl(
      _$UserTagImpl _value, $Res Function(_$UserTagImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tagId = null,
  }) {
    return _then(_$UserTagImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      tagId: null == tagId
          ? _value.tagId
          : tagId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserTagImpl implements _UserTag {
  const _$UserTagImpl(
      {required this.id, @JsonKey(name: 'tag_id') required this.tagId});

  factory _$UserTagImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTagImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'tag_id')
  final int tagId;

  @override
  String toString() {
    return 'UserTag(id: $id, tagId: $tagId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTagImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tagId, tagId) || other.tagId == tagId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, tagId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTagImplCopyWith<_$UserTagImpl> get copyWith =>
      __$$UserTagImplCopyWithImpl<_$UserTagImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTagImplToJson(
      this,
    );
  }
}

abstract class _UserTag implements UserTag {
  const factory _UserTag(
      {required final int id,
      @JsonKey(name: 'tag_id') required final int tagId}) = _$UserTagImpl;

  factory _UserTag.fromJson(Map<String, dynamic> json) = _$UserTagImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'tag_id')
  int get tagId;
  @override
  @JsonKey(ignore: true)
  _$$UserTagImplCopyWith<_$UserTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
