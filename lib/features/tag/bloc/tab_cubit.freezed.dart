// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagState {
  BaseResponse<List<TagModel?>?>? get data =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagStateCopyWith<TagState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagStateCopyWith<$Res> {
  factory $TagStateCopyWith(TagState value, $Res Function(TagState) then) =
      _$TagStateCopyWithImpl<$Res, TagState>;
  @useResult
  $Res call({BaseResponse<List<TagModel?>?>? data});
}

/// @nodoc
class _$TagStateCopyWithImpl<$Res, $Val extends TagState>
    implements $TagStateCopyWith<$Res> {
  _$TagStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<TagModel?>?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagStateImplCopyWith<$Res>
    implements $TagStateCopyWith<$Res> {
  factory _$$TagStateImplCopyWith(
          _$TagStateImpl value, $Res Function(_$TagStateImpl) then) =
      __$$TagStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseResponse<List<TagModel?>?>? data});
}

/// @nodoc
class __$$TagStateImplCopyWithImpl<$Res>
    extends _$TagStateCopyWithImpl<$Res, _$TagStateImpl>
    implements _$$TagStateImplCopyWith<$Res> {
  __$$TagStateImplCopyWithImpl(
      _$TagStateImpl _value, $Res Function(_$TagStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$TagStateImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<TagModel?>?>?,
    ));
  }
}

/// @nodoc

class _$TagStateImpl implements _TagState {
  const _$TagStateImpl({this.data});

  @override
  final BaseResponse<List<TagModel?>?>? data;

  @override
  String toString() {
    return 'TagState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagStateImplCopyWith<_$TagStateImpl> get copyWith =>
      __$$TagStateImplCopyWithImpl<_$TagStateImpl>(this, _$identity);
}

abstract class _TagState implements TagState {
  const factory _TagState({final BaseResponse<List<TagModel?>?>? data}) =
      _$TagStateImpl;

  @override
  BaseResponse<List<TagModel?>?>? get data;
  @override
  @JsonKey(ignore: true)
  _$$TagStateImplCopyWith<_$TagStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
