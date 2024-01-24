part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    BaseResponse<AuthResponse>? statusLoginGoogle,
    BaseResponse<AuthResponse>? statusLoginEmail,
    BaseResponse<AuthResponse>? statusRegisterEmail,
    BaseResponse<void>? statusLogout,
    @Default(AuthenticationStatus.unauthenticated)
    AuthenticationStatus authenticationStatus,
    String? email,
    String? password,
  }) = _AuthState;

  const AuthState._();
  UserRWID get userRwid {
    User? user = statusLoginGoogle?.data?.user;
    print(statusLoginGoogle);
    return UserRWID(
        id: user?.id ?? '',
        name: user?.userMetadata?['name'] ?? '',
        email: user?.userMetadata?['email'] ?? '',
        photo: user?.userMetadata?['avatar_url'] ?? '');
  }
}
