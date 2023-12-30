part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(ProgressStatus.initial) ProgressStatus statusLogin,
    @Default(ProgressStatus.initial) ProgressStatus statusLogout,
    @Default(AuthenticationStatus.logout)
    AuthenticationStatus authenticationStatus,
    AuthResponse? authResponse,
    String? errorMessage,
  }) = _AuthState;

  const AuthState._();
  UserRWID get userRwid {
    User? user = authResponse?.user;
    return UserRWID(
        id: user?.id ?? '',
        name: user?.userMetadata?['name'] ?? '',
        email: user?.userMetadata?['email'] ?? '',
        photo: user?.userMetadata?['avatar_url'] ?? '');
  }
}
