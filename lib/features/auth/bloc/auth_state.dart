part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(ProgressStatus.initial) ProgressStatus status,
  }) = _AuthState;
}
