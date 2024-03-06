// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_rwid.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRWIDAdapter extends TypeAdapter<_$UserRWIDImpl> {
  @override
  final int typeId = 1;

  @override
  _$UserRWIDImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserRWIDImpl(
      id: fields[0] as dynamic,
      name: fields[1] as String,
      email: fields[2] as String,
      photo: fields[3] as String,
      userId: fields[4] as String?,
      address: fields[5] as String?,
      phone: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserRWIDImpl obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRWIDAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserRWIDImpl _$$UserRWIDImplFromJson(Map<String, dynamic> json) =>
    _$UserRWIDImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String,
      userId: json['user_id'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$UserRWIDImplToJson(_$UserRWIDImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photo': instance.photo,
      'user_id': instance.userId,
      'address': instance.address,
      'phone': instance.phone,
    };
