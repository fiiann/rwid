import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_rwid.freezed.dart';

@freezed
class UserRWID with _$UserRWID {
  const factory UserRWID({
    required String id,
    required String name,
    required String email,
    required String photo,
  }) = _UserRWID;
}
