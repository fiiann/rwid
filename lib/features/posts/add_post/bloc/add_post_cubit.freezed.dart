// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPostState {
  BaseResponse<List<TagModel>?>? get stateListTag =>
      throw _privateConstructorUsedError;
  BaseResponse<void>? get stateSubmit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPostStateCopyWith<AddPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostStateCopyWith<$Res> {
  factory $AddPostStateCopyWith(
          AddPostState value, $Res Function(AddPostState) then) =
      _$AddPostStateCopyWithImpl<$Res, AddPostState>;
  @useResult
  $Res call(
      {BaseResponse<List<TagModel>?>? stateListTag,
      BaseResponse<void>? stateSubmit});
}

/// @nodoc
class _$AddPostStateCopyWithImpl<$Res, $Val extends AddPostState>
    implements $AddPostStateCopyWith<$Res> {
  _$AddPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateListTag = freezed,
    Object? stateSubmit = freezed,
  }) {
    return _then(_value.copyWith(
      stateListTag: freezed == stateListTag
          ? _value.stateListTag
          : stateListTag // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<TagModel>?>?,
      stateSubmit: freezed == stateSubmit
          ? _value.stateSubmit
          : stateSubmit // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPostStateImplCopyWith<$Res>
    implements $AddPostStateCopyWith<$Res> {
  factory _$$AddPostStateImplCopyWith(
          _$AddPostStateImpl value, $Res Function(_$AddPostStateImpl) then) =
      __$$AddPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseResponse<List<TagModel>?>? stateListTag,
      BaseResponse<void>? stateSubmit});
}

/// @nodoc
class __$$AddPostStateImplCopyWithImpl<$Res>
    extends _$AddPostStateCopyWithImpl<$Res, _$AddPostStateImpl>
    implements _$$AddPostStateImplCopyWith<$Res> {
  __$$AddPostStateImplCopyWithImpl(
      _$AddPostStateImpl _value, $Res Function(_$AddPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateListTag = freezed,
    Object? stateSubmit = freezed,
  }) {
    return _then(_$AddPostStateImpl(
      stateListTag: freezed == stateListTag
          ? _value.stateListTag
          : stateListTag // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<TagModel>?>?,
      stateSubmit: freezed == stateSubmit
          ? _value.stateSubmit
          : stateSubmit // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>?,
    ));
  }
}

/// @nodoc

class _$AddPostStateImpl extends _AddPostState {
  const _$AddPostStateImpl({this.stateListTag, this.stateSubmit}) : super._();

  @override
  final BaseResponse<List<TagModel>?>? stateListTag;
  @override
  final BaseResponse<void>? stateSubmit;

  @override
  String toString() {
    return 'AddPostState(stateListTag: $stateListTag, stateSubmit: $stateSubmit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPostStateImpl &&
            (identical(other.stateListTag, stateListTag) ||
                other.stateListTag == stateListTag) &&
            (identical(other.stateSubmit, stateSubmit) ||
                other.stateSubmit == stateSubmit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateListTag, stateSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPostStateImplCopyWith<_$AddPostStateImpl> get copyWith =>
      __$$AddPostStateImplCopyWithImpl<_$AddPostStateImpl>(this, _$identity);
}

abstract class _AddPostState extends AddPostState {
  const factory _AddPostState(
      {final BaseResponse<List<TagModel>?>? stateListTag,
      final BaseResponse<void>? stateSubmit}) = _$AddPostStateImpl;
  const _AddPostState._() : super._();

  @override
  BaseResponse<List<TagModel>?>? get stateListTag;
  @override
  BaseResponse<void>? get stateSubmit;
  @override
  @JsonKey(ignore: true)
  _$$AddPostStateImplCopyWith<_$AddPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
