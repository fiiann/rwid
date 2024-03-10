// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_post_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListPostState {
  BaseResponse<List<PostModel>?> get stateList =>
      throw _privateConstructorUsedError;
  bool get hasReachMax => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  BaseResponse<void> get stateBookmark => throw _privateConstructorUsedError;
  BaseResponse<List<UserTag>?> get stateTag =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListPostStateCopyWith<ListPostState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListPostStateCopyWith<$Res> {
  factory $ListPostStateCopyWith(
          ListPostState value, $Res Function(ListPostState) then) =
      _$ListPostStateCopyWithImpl<$Res, ListPostState>;
  @useResult
  $Res call(
      {BaseResponse<List<PostModel>?> stateList,
      bool hasReachMax,
      String? keyword,
      BaseResponse<void> stateBookmark,
      BaseResponse<List<UserTag>?> stateTag});
}

/// @nodoc
class _$ListPostStateCopyWithImpl<$Res, $Val extends ListPostState>
    implements $ListPostStateCopyWith<$Res> {
  _$ListPostStateCopyWithImpl(this._value, this._then);

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
    Object? stateBookmark = null,
    Object? stateTag = null,
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
      stateBookmark: null == stateBookmark
          ? _value.stateBookmark
          : stateBookmark // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>,
      stateTag: null == stateTag
          ? _value.stateTag
          : stateTag // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<UserTag>?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListPostStateImplCopyWith<$Res>
    implements $ListPostStateCopyWith<$Res> {
  factory _$$ListPostStateImplCopyWith(
          _$ListPostStateImpl value, $Res Function(_$ListPostStateImpl) then) =
      __$$ListPostStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseResponse<List<PostModel>?> stateList,
      bool hasReachMax,
      String? keyword,
      BaseResponse<void> stateBookmark,
      BaseResponse<List<UserTag>?> stateTag});
}

/// @nodoc
class __$$ListPostStateImplCopyWithImpl<$Res>
    extends _$ListPostStateCopyWithImpl<$Res, _$ListPostStateImpl>
    implements _$$ListPostStateImplCopyWith<$Res> {
  __$$ListPostStateImplCopyWithImpl(
      _$ListPostStateImpl _value, $Res Function(_$ListPostStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateList = null,
    Object? hasReachMax = null,
    Object? keyword = freezed,
    Object? stateBookmark = null,
    Object? stateTag = null,
  }) {
    return _then(_$ListPostStateImpl(
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
      stateBookmark: null == stateBookmark
          ? _value.stateBookmark
          : stateBookmark // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>,
      stateTag: null == stateTag
          ? _value.stateTag
          : stateTag // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<UserTag>?>,
    ));
  }
}

/// @nodoc

class _$ListPostStateImpl extends _ListPostState {
  const _$ListPostStateImpl(
      {this.stateList = const BaseResponse(),
      this.hasReachMax = false,
      this.keyword,
      this.stateBookmark = const BaseResponse(),
      this.stateTag = const BaseResponse()})
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
  @JsonKey()
  final BaseResponse<void> stateBookmark;
  @override
  @JsonKey()
  final BaseResponse<List<UserTag>?> stateTag;

  @override
  String toString() {
    return 'ListPostState(stateList: $stateList, hasReachMax: $hasReachMax, keyword: $keyword, stateBookmark: $stateBookmark, stateTag: $stateTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPostStateImpl &&
            (identical(other.stateList, stateList) ||
                other.stateList == stateList) &&
            (identical(other.hasReachMax, hasReachMax) ||
                other.hasReachMax == hasReachMax) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.stateBookmark, stateBookmark) ||
                other.stateBookmark == stateBookmark) &&
            (identical(other.stateTag, stateTag) ||
                other.stateTag == stateTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, stateList, hasReachMax, keyword, stateBookmark, stateTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListPostStateImplCopyWith<_$ListPostStateImpl> get copyWith =>
      __$$ListPostStateImplCopyWithImpl<_$ListPostStateImpl>(this, _$identity);
}

abstract class _ListPostState extends ListPostState {
  const factory _ListPostState(
      {final BaseResponse<List<PostModel>?> stateList,
      final bool hasReachMax,
      final String? keyword,
      final BaseResponse<void> stateBookmark,
      final BaseResponse<List<UserTag>?> stateTag}) = _$ListPostStateImpl;
  const _ListPostState._() : super._();

  @override
  BaseResponse<List<PostModel>?> get stateList;
  @override
  bool get hasReachMax;
  @override
  String? get keyword;
  @override
  BaseResponse<void> get stateBookmark;
  @override
  BaseResponse<List<UserTag>?> get stateTag;
  @override
  @JsonKey(ignore: true)
  _$$ListPostStateImplCopyWith<_$ListPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
