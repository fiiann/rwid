import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:rwid/core/constant/constant.dart';

part 'user_rwid.freezed.dart';
part 'user_rwid.g.dart';

@freezed
class UserRWID with _$UserRWID {
  @HiveType(typeId: 1, adapterName: 'UserRWIDAdapter')
  const factory UserRWID({
    @JsonKey(includeToJson: false, includeFromJson: false)
    @HiveField(0)
    dynamic id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required String photo,
    @JsonKey(name: 'user_id') @HiveField(4) String? userId,
    @HiveField(5) required String? address,
    @HiveField(6) required String? phone,
  }) = _UserRWID;

  factory UserRWID.fromJson(Map<String, dynamic> json) =>
      _$UserRWIDFromJson(json);

  factory UserRWID.fromForm(GlobalKey<FormBuilderState> formKey) {
    final box = Hive.box(authBoxName);
    UserRWID user = box.get('user');
    final name = formKey.currentState?.fields['name']!.value as String;
    final phone = formKey.currentState?.fields['phone']!.value as String;
    final address = formKey.currentState?.fields['address']!.value as String;
    user = user.copyWith(name: name, phone: phone, address: address);
    return user;
  }
}
