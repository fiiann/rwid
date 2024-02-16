// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_rwid.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserRWID _$UserRWIDFromJson(Map<String, dynamic> json) {
  return _UserRWID.fromJson(json);
}

/// @nodoc
mixin _$UserRWID {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get email => throw _privateConstructorUsedError;
  @HiveField(3)
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserRWIDCopyWith<UserRWID> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserRWIDCopyWith<$Res> {
  factory $UserRWIDCopyWith(UserRWID value, $Res Function(UserRWID) then) =
      _$UserRWIDCopyWithImpl<$Res, UserRWID>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) String photo});
}

/// @nodoc
class _$UserRWIDCopyWithImpl<$Res, $Val extends UserRWID>
    implements $UserRWIDCopyWith<$Res> {
  _$UserRWIDCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserRWIDImplCopyWith<$Res>
    implements $UserRWIDCopyWith<$Res> {
  factory _$$UserRWIDImplCopyWith(
          _$UserRWIDImpl value, $Res Function(_$UserRWIDImpl) then) =
      __$$UserRWIDImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String email,
      @HiveField(3) String photo});
}

/// @nodoc
class __$$UserRWIDImplCopyWithImpl<$Res>
    extends _$UserRWIDCopyWithImpl<$Res, _$UserRWIDImpl>
    implements _$$UserRWIDImplCopyWith<$Res> {
  __$$UserRWIDImplCopyWithImpl(
      _$UserRWIDImpl _value, $Res Function(_$UserRWIDImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? photo = null,
  }) {
    return _then(_$UserRWIDImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'UserRWIDAdapter')
class _$UserRWIDImpl implements _UserRWID {
  const _$UserRWIDImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.email,
      @HiveField(3) required this.photo});

  factory _$UserRWIDImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserRWIDImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String email;
  @override
  @HiveField(3)
  final String photo;

  @override
  String toString() {
    return 'UserRWID(id: $id, name: $name, email: $email, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserRWIDImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserRWIDImplCopyWith<_$UserRWIDImpl> get copyWith =>
      __$$UserRWIDImplCopyWithImpl<_$UserRWIDImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserRWIDImplToJson(
      this,
    );
  }
}

abstract class _UserRWID implements UserRWID {
  const factory _UserRWID(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String email,
      @HiveField(3) required final String photo}) = _$UserRWIDImpl;

  factory _UserRWID.fromJson(Map<String, dynamic> json) =
      _$UserRWIDImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get email;
  @override
  @HiveField(3)
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$UserRWIDImplCopyWith<_$UserRWIDImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
