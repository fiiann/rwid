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
  ProgressStatus get statusLogin => throw _privateConstructorUsedError;
  ProgressStatus get statusLogout => throw _privateConstructorUsedError;
  AuthenticationStatus get authenticationStatus =>
      throw _privateConstructorUsedError;
  AuthResponse? get authResponse => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

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
      {ProgressStatus statusLogin,
      ProgressStatus statusLogout,
      AuthenticationStatus authenticationStatus,
      AuthResponse? authResponse,
      String? errorMessage});
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
    Object? statusLogin = null,
    Object? statusLogout = null,
    Object? authenticationStatus = null,
    Object? authResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      statusLogin: null == statusLogin
          ? _value.statusLogin
          : statusLogin // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      statusLogout: null == statusLogout
          ? _value.statusLogout
          : statusLogout // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      authenticationStatus: null == authenticationStatus
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      authResponse: freezed == authResponse
          ? _value.authResponse
          : authResponse // ignore: cast_nullable_to_non_nullable
              as AuthResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
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
      {ProgressStatus statusLogin,
      ProgressStatus statusLogout,
      AuthenticationStatus authenticationStatus,
      AuthResponse? authResponse,
      String? errorMessage});
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
    Object? statusLogin = null,
    Object? statusLogout = null,
    Object? authenticationStatus = null,
    Object? authResponse = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthStateImpl(
      statusLogin: null == statusLogin
          ? _value.statusLogin
          : statusLogin // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      statusLogout: null == statusLogout
          ? _value.statusLogout
          : statusLogout // ignore: cast_nullable_to_non_nullable
              as ProgressStatus,
      authenticationStatus: null == authenticationStatus
          ? _value.authenticationStatus
          : authenticationStatus // ignore: cast_nullable_to_non_nullable
              as AuthenticationStatus,
      authResponse: freezed == authResponse
          ? _value.authResponse
          : authResponse // ignore: cast_nullable_to_non_nullable
              as AuthResponse?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl extends _AuthState with DiagnosticableTreeMixin {
  const _$AuthStateImpl(
      {this.statusLogin = ProgressStatus.initial,
      this.statusLogout = ProgressStatus.initial,
      this.authenticationStatus = AuthenticationStatus.logout,
      this.authResponse,
      this.errorMessage})
      : super._();

  @override
  @JsonKey()
  final ProgressStatus statusLogin;
  @override
  @JsonKey()
  final ProgressStatus statusLogout;
  @override
  @JsonKey()
  final AuthenticationStatus authenticationStatus;
  @override
  final AuthResponse? authResponse;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AuthState(statusLogin: $statusLogin, statusLogout: $statusLogout, authenticationStatus: $authenticationStatus, authResponse: $authResponse, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AuthState'))
      ..add(DiagnosticsProperty('statusLogin', statusLogin))
      ..add(DiagnosticsProperty('statusLogout', statusLogout))
      ..add(DiagnosticsProperty('authenticationStatus', authenticationStatus))
      ..add(DiagnosticsProperty('authResponse', authResponse))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.statusLogin, statusLogin) ||
                other.statusLogin == statusLogin) &&
            (identical(other.statusLogout, statusLogout) ||
                other.statusLogout == statusLogout) &&
            (identical(other.authenticationStatus, authenticationStatus) ||
                other.authenticationStatus == authenticationStatus) &&
            (identical(other.authResponse, authResponse) ||
                other.authResponse == authResponse) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statusLogin, statusLogout,
      authenticationStatus, authResponse, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState extends AuthState {
  const factory _AuthState(
      {final ProgressStatus statusLogin,
      final ProgressStatus statusLogout,
      final AuthenticationStatus authenticationStatus,
      final AuthResponse? authResponse,
      final String? errorMessage}) = _$AuthStateImpl;
  const _AuthState._() : super._();

  @override
  ProgressStatus get statusLogin;
  @override
  ProgressStatus get statusLogout;
  @override
  AuthenticationStatus get authenticationStatus;
  @override
  AuthResponse? get authResponse;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
