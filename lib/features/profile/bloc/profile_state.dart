part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(BaseResponse()) BaseResponse<void> stateSubmit,
  }) = _ProfileState;
}
