// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_bookmark_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListBookmarkState {
  BaseResponse<List<PostModel>?> get stateList =>
      throw _privateConstructorUsedError;
  bool get hasReachMax => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListBookmarkStateCopyWith<ListBookmarkState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListBookmarkStateCopyWith<$Res> {
  factory $ListBookmarkStateCopyWith(
          ListBookmarkState value, $Res Function(ListBookmarkState) then) =
      _$ListBookmarkStateCopyWithImpl<$Res, ListBookmarkState>;
  @useResult
  $Res call(
      {BaseResponse<List<PostModel>?> stateList,
      bool hasReachMax,
      String? keyword});
}

/// @nodoc
class _$ListBookmarkStateCopyWithImpl<$Res, $Val extends ListBookmarkState>
    implements $ListBookmarkStateCopyWith<$Res> {
  _$ListBookmarkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateList = null,
    Object? hasReachMax = null,
    Object? keyword = freezed,
  }) {
    return _then(_value.copyWith(
      stateList: null == stateList
          ? _value.stateList
          : stateList // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<PostModel>?>,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListBookmarkStateImplCopyWith<$Res>
    implements $ListBookmarkStateCopyWith<$Res> {
  factory _$$ListBookmarkStateImplCopyWith(_$ListBookmarkStateImpl value,
          $Res Function(_$ListBookmarkStateImpl) then) =
      __$$ListBookmarkStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseResponse<List<PostModel>?> stateList,
      bool hasReachMax,
      String? keyword});
}

/// @nodoc
class __$$ListBookmarkStateImplCopyWithImpl<$Res>
    extends _$ListBookmarkStateCopyWithImpl<$Res, _$ListBookmarkStateImpl>
    implements _$$ListBookmarkStateImplCopyWith<$Res> {
  __$$ListBookmarkStateImplCopyWithImpl(_$ListBookmarkStateImpl _value,
      $Res Function(_$ListBookmarkStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateList = null,
    Object? hasReachMax = null,
    Object? keyword = freezed,
  }) {
    return _then(_$ListBookmarkStateImpl(
      stateList: null == stateList
          ? _value.stateList
          : stateList // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<PostModel>?>,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ListBookmarkStateImpl extends _ListBookmarkState {
  const _$ListBookmarkStateImpl(
      {this.stateList = const BaseResponse(),
      this.hasReachMax = false,
      this.keyword})
      : super._();

  @override
  @JsonKey()
  final BaseResponse<List<PostModel>?> stateList;
  @override
  @JsonKey()
  final bool hasReachMax;
  @override
  final String? keyword;

  @override
  String toString() {
    return 'ListBookmarkState(stateList: $stateList, hasReachMax: $hasReachMax, keyword: $keyword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListBookmarkStateImpl &&
            (identical(other.stateList, stateList) ||
                other.stateList == stateList) &&
            (identical(other.hasReachMax, hasReachMax) ||
                other.hasReachMax == hasReachMax) &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stateList, hasReachMax, keyword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListBookmarkStateImplCopyWith<_$ListBookmarkStateImpl> get copyWith =>
      __$$ListBookmarkStateImplCopyWithImpl<_$ListBookmarkStateImpl>(
          this, _$identity);
}

abstract class _ListBookmarkState extends ListBookmarkState {
  const factory _ListBookmarkState(
      {final BaseResponse<List<PostModel>?> stateList,
      final bool hasReachMax,
      final String? keyword}) = _$ListBookmarkStateImpl;
  const _ListBookmarkState._() : super._();

  @override
  BaseResponse<List<PostModel>?> get stateList;
  @override
  bool get hasReachMax;
  @override
  String? get keyword;
  @override
  @JsonKey(ignore: true)
  _$$ListBookmarkStateImplCopyWith<_$ListBookmarkStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
