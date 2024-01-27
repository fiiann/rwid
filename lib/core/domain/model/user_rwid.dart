import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_rwid.freezed.dart';
part 'user_rwid.g.dart';

@freezed
class UserRWID with _$UserRWID {
  @HiveType(typeId: 1, adapterName: 'UserRWIDAdapter')
  const factory UserRWID({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required String photo,
  }) = _UserRWID;

  factory UserRWID.fromJson(Map<String, dynamic> json) =>
      _$UserRWIDFromJson(json);
}