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
  Map<String, BaseResponse<List<PostModel>>> get stateListPost =>
      throw _privateConstructorUsedError;
  bool get hasReachMax => throw _privateConstructorUsedError;
  Map<String, bool> get hasReachMaxPost => throw _privateConstructorUsedError;
  String? get keyword => throw _privateConstructorUsedError;
  BaseResponse<void> get stateBookmark => throw _privateConstructorUsedError;
  BaseResponse<List<UserTag>?> get stateTag =>
      throw _privateConstructorUsedError;
  UserTag? get selectedTag => throw _privateConstructorUsedError;

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
      Map<String, BaseResponse<List<PostModel>>> stateListPost,
      bool hasReachMax,
      Map<String, bool> hasReachMaxPost,
      String? keyword,
      BaseResponse<void> stateBookmark,
      BaseResponse<List<UserTag>?> stateTag,
      UserTag? selectedTag});

  $UserTagCopyWith<$Res>? get selectedTag;
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
    Object? stateListPost = null,
    Object? hasReachMax = null,
    Object? hasReachMaxPost = null,
    Object? keyword = freezed,
    Object? stateBookmark = null,
    Object? stateTag = null,
    Object? selectedTag = freezed,
  }) {
    return _then(_value.copyWith(
      stateList: null == stateList
          ? _value.stateList
          : stateList // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<PostModel>?>,
      stateListPost: null == stateListPost
          ? _value.stateListPost
          : stateListPost // ignore: cast_nullable_to_non_nullable
              as Map<String, BaseResponse<List<PostModel>>>,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachMaxPost: null == hasReachMaxPost
          ? _value.hasReachMaxPost
          : hasReachMaxPost // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
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
      selectedTag: freezed == selectedTag
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as UserTag?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTagCopyWith<$Res>? get selectedTag {
    if (_value.selectedTag == null) {
      return null;
    }

    return $UserTagCopyWith<$Res>(_value.selectedTag!, (value) {
      return _then(_value.copyWith(selectedTag: value) as $Val);
    });
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
      Map<String, BaseResponse<List<PostModel>>> stateListPost,
      bool hasReachMax,
      Map<String, bool> hasReachMaxPost,
      String? keyword,
      BaseResponse<void> stateBookmark,
      BaseResponse<List<UserTag>?> stateTag,
      UserTag? selectedTag});

  @override
  $UserTagCopyWith<$Res>? get selectedTag;
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
    Object? stateListPost = null,
    Object? hasReachMax = null,
    Object? hasReachMaxPost = null,
    Object? keyword = freezed,
    Object? stateBookmark = null,
    Object? stateTag = null,
    Object? selectedTag = freezed,
  }) {
    return _then(_$ListPostStateImpl(
      stateList: null == stateList
          ? _value.stateList
          : stateList // ignore: cast_nullable_to_non_nullable
              as BaseResponse<List<PostModel>?>,
      stateListPost: null == stateListPost
          ? _value._stateListPost
          : stateListPost // ignore: cast_nullable_to_non_nullable
              as Map<String, BaseResponse<List<PostModel>>>,
      hasReachMax: null == hasReachMax
          ? _value.hasReachMax
          : hasReachMax // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachMaxPost: null == hasReachMaxPost
          ? _value._hasReachMaxPost
          : hasReachMaxPost // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
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
      selectedTag: freezed == selectedTag
          ? _value.selectedTag
          : selectedTag // ignore: cast_nullable_to_non_nullable
              as UserTag?,
    ));
  }
}

/// @nodoc

class _$ListPostStateImpl extends _ListPostState {
  const _$ListPostStateImpl(
      {this.stateList = const BaseResponse(),
      final Map<String, BaseResponse<List<PostModel>>> stateListPost = const {},
      this.hasReachMax = false,
      final Map<String, bool> hasReachMaxPost = const {},
      this.keyword,
      this.stateBookmark = const BaseResponse(),
      this.stateTag = const BaseResponse(),
      this.selectedTag})
      : _stateListPost = stateListPost,
        _hasReachMaxPost = hasReachMaxPost,
        super._();

  @override
  @JsonKey()
  final BaseResponse<List<PostModel>?> stateList;
  final Map<String, BaseResponse<List<PostModel>>> _stateListPost;
  @override
  @JsonKey()
  Map<String, BaseResponse<List<PostModel>>> get stateListPost {
    if (_stateListPost is EqualUnmodifiableMapView) return _stateListPost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stateListPost);
  }

  @override
  @JsonKey()
  final bool hasReachMax;
  final Map<String, bool> _hasReachMaxPost;
  @override
  @JsonKey()
  Map<String, bool> get hasReachMaxPost {
    if (_hasReachMaxPost is EqualUnmodifiableMapView) return _hasReachMaxPost;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_hasReachMaxPost);
  }

  @override
  final String? keyword;
  @override
  @JsonKey()
  final BaseResponse<void> stateBookmark;
  @override
  @JsonKey()
  final BaseResponse<List<UserTag>?> stateTag;
  @override
  final UserTag? selectedTag;

  @override
  String toString() {
    return 'ListPostState(stateList: $stateList, stateListPost: $stateListPost, hasReachMax: $hasReachMax, hasReachMaxPost: $hasReachMaxPost, keyword: $keyword, stateBookmark: $stateBookmark, stateTag: $stateTag, selectedTag: $selectedTag)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListPostStateImpl &&
            (identical(other.stateList, stateList) ||
                other.stateList == stateList) &&
            const DeepCollectionEquality()
                .equals(other._stateListPost, _stateListPost) &&
            (identical(other.hasReachMax, hasReachMax) ||
                other.hasReachMax == hasReachMax) &&
            const DeepCollectionEquality()
                .equals(other._hasReachMaxPost, _hasReachMaxPost) &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.stateBookmark, stateBookmark) ||
                other.stateBookmark == stateBookmark) &&
            (identical(other.stateTag, stateTag) ||
                other.stateTag == stateTag) &&
            (identical(other.selectedTag, selectedTag) ||
                other.selectedTag == selectedTag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateList,
      const DeepCollectionEquality().hash(_stateListPost),
      hasReachMax,
      const DeepCollectionEquality().hash(_hasReachMaxPost),
      keyword,
      stateBookmark,
      stateTag,
      selectedTag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListPostStateImplCopyWith<_$ListPostStateImpl> get copyWith =>
      __$$ListPostStateImplCopyWithImpl<_$ListPostStateImpl>(this, _$identity);
}

abstract class _ListPostState extends ListPostState {
  const factory _ListPostState(
      {final BaseResponse<List<PostModel>?> stateList,
      final Map<String, BaseResponse<List<PostModel>>> stateListPost,
      final bool hasReachMax,
      final Map<String, bool> hasReachMaxPost,
      final String? keyword,
      final BaseResponse<void> stateBookmark,
      final BaseResponse<List<UserTag>?> stateTag,
      final UserTag? selectedTag}) = _$ListPostStateImpl;
  const _ListPostState._() : super._();

  @override
  BaseResponse<List<PostModel>?> get stateList;
  @override
  Map<String, BaseResponse<List<PostModel>>> get stateListPost;
  @override
  bool get hasReachMax;
  @override
  Map<String, bool> get hasReachMaxPost;
  @override
  String? get keyword;
  @override
  BaseResponse<void> get stateBookmark;
  @override
  BaseResponse<List<UserTag>?> get stateTag;
  @override
  UserTag? get selectedTag;
  @override
  @JsonKey(ignore: true)
  _$$ListPostStateImplCopyWith<_$ListPostStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
