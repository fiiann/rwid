// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  BaseResponse<AuthResponse>? get statusLoginGoogle =>
      throw _privateConstructorUsedError;
  BaseResponse<AuthResponse>? get statusLoginEmail =>
      throw _privateConstructorUsedError;
  BaseResponse<AuthResponse>? get statusRegisterEmail =>
      throw _privateConstructorUsedError;
  BaseResponse<void>? get statusLogout => throw _privateConstructorUsedError;
  AuthenticationStatus get authenticationStatus =>
      throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {BaseResponse<AuthResponse>? statusLoginGoogle,
      BaseResponse<AuthResponse>? statusLoginEmail,
      BaseResponse<AuthResponse>? statusRegisterEmail,
      BaseResponse<void>? statusLogout,
      AuthenticationStatus authenticationStatus,
      String? email,
      String? password});
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusLoginGoogle = freezed,
    Object? statusLoginEmail = freezed,
    Object? statusRegisterEmail = freezed,
    Object? statusLogout = freezed,
    Object? authenticationStatus = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      statusLoginGoogle: freezed == statusLoginGoogle
          ? _value.statusLoginGoogle
          : statusLoginGoogle // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusLoginEmail: freezed == statusLoginEmail
          ? _value.statusLoginEmail
          : statusLoginEmail // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusRegisterEmail: freezed == statusRegisterEmail
          ? _value.statusRegisterEmail
          : statusRegisterEmail // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusLogout: freezed == statusLogout
          ? _value.statusLogout
          : statusLogout // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>?,
      authenticationStatus: null == authenticationStatus
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseResponse<AuthResponse>? statusLoginGoogle,
      BaseResponse<AuthResponse>? statusLoginEmail,
      BaseResponse<AuthResponse>? statusRegisterEmail,
      BaseResponse<void>? statusLogout,
      AuthenticationStatus authenticationStatus,
      String? email,
      String? password});
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusLoginGoogle = freezed,
    Object? statusLoginEmail = freezed,
    Object? statusRegisterEmail = freezed,
    Object? statusLogout = freezed,
    Object? authenticationStatus = null,
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_$AuthStateImpl(
      statusLoginGoogle: freezed == statusLoginGoogle
          ? _value.statusLoginGoogle
          : statusLoginGoogle // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusLoginEmail: freezed == statusLoginEmail
          ? _value.statusLoginEmail
          : statusLoginEmail // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusRegisterEmail: freezed == statusRegisterEmail
          ? _value.statusRegisterEmail
          : statusRegisterEmail // ignore: cast_nullable_to_non_nullable
              as BaseResponse<AuthResponse>?,
      statusLogout: freezed == statusLogout
          ? _value.statusLogout
          : statusLogout // ignore: cast_nullable_to_non_nullable
              as BaseResponse<void>?,
      authenticationStatus: null == authenticationStatus
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState with DiagnosticableTreeMixin {
  const _$AuthStateImpl(
      {this.statusLoginGoogle,
      this.statusLoginEmail,
      this.statusRegisterEmail,
      this.statusLogout,
      this.authenticationStatus = AuthenticationStatus.logout,
      this.email,
      this.password})
      : super._();

  @override
  final BaseResponse<AuthResponse>? statusLoginGoogle;
  @override
  final BaseResponse<AuthResponse>? statusLoginEmail;
  @override
  final BaseResponse<AuthResponse>? statusRegisterEmail;
  @override
  final BaseResponse<void>? statusLogout;
  @override
  @JsonKey()
  final AuthenticationStatus authenticationStatus;
  @override
  final String? email;
  @override
  final String? password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(statusLoginGoogle: $statusLoginGoogle, statusLoginEmail: $statusLoginEmail, statusRegisterEmail: $statusRegisterEmail, statusLogout: $statusLogout, authenticationStatus: $authenticationStatus, email: $email, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('statusLoginGoogle', statusLoginGoogle))
      ..add(DiagnosticsProperty('statusLoginEmail', statusLoginEmail))
      ..add(DiagnosticsProperty('statusRegisterEmail', statusRegisterEmail))
      ..add(DiagnosticsProperty('statusLogout', statusLogout))
      ..add(DiagnosticsProperty('authenticationStatus', authenticationStatus))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.statusLoginGoogle, statusLoginGoogle) ||
                other.statusLoginGoogle == statusLoginGoogle) &&
            (identical(other.statusLoginEmail, statusLoginEmail) ||
                other.statusLoginEmail == statusLoginEmail) &&
            (identical(other.statusRegisterEmail, statusRegisterEmail) ||
                other.statusRegisterEmail == statusRegisterEmail) &&
            (identical(other.statusLogout, statusLogout) ||
                other.statusLogout == statusLogout) &&
            (identical(other.authenticationStatus, authenticationStatus) ||
                other.authenticationStatus == authenticationStatus) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusLoginGoogle,
      statusLoginEmail,
      statusRegisterEmail,
      statusLogout,
      authenticationStatus,
      email,
      password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final BaseResponse<AuthResponse>? statusLoginGoogle,
      final BaseResponse<AuthResponse>? statusLoginEmail,
      final BaseResponse<AuthResponse>? statusRegisterEmail,
      final BaseResponse<void>? statusLogout,
      final AuthenticationStatus authenticationStatus,
      final String? email,
      final String? password}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  BaseResponse<AuthResponse>? get statusLoginGoogle;
  @override
  BaseResponse<AuthResponse>? get statusLoginEmail;
  @override
  BaseResponse<AuthResponse>? get statusRegisterEmail;
  @override
  BaseResponse<void>? get statusLogout;
  @override
  AuthenticationStatus get authenticationStatus;
  @override
  String? get email;
  @override
  String? get password;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
