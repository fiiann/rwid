part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class SubmitProfile extends ProfileEvent {
  final UserRWID user;

  const SubmitProfile({required this.user});
  @override
  List<Object?> get props => [user];
}
