// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_post_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailPostState {
  BaseResponse<PostModel?>? get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailPostStateCopyWith<DetailPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailPostStateCopyWith<$Res> {
  factory $DetailPostStateCopyWith(
          DetailPostState value, $Res Function(DetailPostState) then) =
      _$DetailPostStateCopyWithImpl<$Res, DetailPostState>;
  @useResult
  $Res call({BaseResponse<PostModel?>? state});
}

/// @nodoc
class _$DetailPostStateCopyWithImpl<$Res, $Val extends DetailPostState>
    implements $DetailPostStateCopyWith<$Res> {
  _$DetailPostStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BaseResponse<PostModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DetailPostStateImplCopyWith<$Res>
    implements $DetailPostStateCopyWith<$Res> {
  factory _$$DetailPostStateImplCopyWith(_$DetailPostStateImpl value,
          $Res Function(_$DetailPostStateImpl) then) =
      __$$DetailPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaseResponse<PostModel?>? state});
}

/// @nodoc
class __$$DetailPostStateImplCopyWithImpl<$Res>
    extends _$DetailPostStateCopyWithImpl<$Res, _$DetailPostStateImpl>
    implements _$$DetailPostStateImplCopyWith<$Res> {
  __$$DetailPostStateImplCopyWithImpl(
      _$DetailPostStateImpl _value, $Res Function(_$DetailPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(_$DetailPostStateImpl(
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BaseResponse<PostModel?>?,
    ));
  }
}

/// @nodoc

class _$DetailPostStateImpl implements _DetailPostState {
  const _$DetailPostStateImpl({this.state});

  @override
  final BaseResponse<PostModel?>? state;

  @override
  String toString() {
    return 'DetailPostState(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailPostStateImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailPostStateImplCopyWith<_$DetailPostStateImpl> get copyWith =>
      __$$DetailPostStateImplCopyWithImpl<_$DetailPostStateImpl>(
          this, _$identity);
}

abstract class _DetailPostState implements DetailPostState {
  const factory _DetailPostState({final BaseResponse<PostModel?>? state}) =
      _$DetailPostStateImpl;

  @override
  BaseResponse<PostModel?>? get state;
  @override
  @JsonKey(ignore: true)
  _$$DetailPostStateImplCopyWith<_$DetailPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
