// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticated_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthenticatedUserModelAdapter
    extends TypeAdapter<AuthenticatedUserModel> {
  @override
  final int typeId = 8;

  @override
  AuthenticatedUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthenticatedUserModel(
      id: fields[0] == null ? '' : fields[0] as String,
      name: fields[5] == null ? 'Guest' : fields[5] as String?,
      email: fields[1] == null ? '' : fields[1] as String,
      gender: fields[11] == null ? 'Unknown' : fields[11] as String?,
      publicId: fields[2] == null ? 0 : fields[2] as int,
      connectCost: fields[31] == null ? 1 : fields[31] as int?,
      createdAt: fields[7] as DateTime?,
      dateOfBirth: fields[10] as DateTime?,
      religionName: fields[30] as String?,
      maritalStatus: fields[15] as String?,
      visibilityStatus: fields[9] == null ? 'PRIVATE' : fields[9] as String?,
      googleUserId: fields[28] as int?,
      facebookUserId: fields[29] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthenticatedUserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(5)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.publicId)
      ..writeByte(31)
      ..write(obj.connectCost)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.dateOfBirth)
      ..writeByte(30)
      ..write(obj.religionName)
      ..writeByte(15)
      ..write(obj.maritalStatus)
      ..writeByte(9)
      ..write(obj.visibilityStatus)
      ..writeByte(28)
      ..write(obj.googleUserId)
      ..writeByte(29)
      ..write(obj.facebookUserId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthenticatedUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatedUserModel _$AuthenticatedUserModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticatedUserModel(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Guest',
      email: json['email'] as String? ?? '',
      gender: json['gender'] as String? ?? 'Unknown',
      publicId: json['public_id'] as int? ?? 0,
      connectCost: json['connect_cost'] as int? ?? 1,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      religionName: json['religion_name'] as String?,
      maritalStatus: json['marital_status'] as String?,
      visibilityStatus: json['visibility_status'] as String? ?? 'PRIVATE',
      googleUserId: json['google_user_id'] as int?,
      facebookUserId: json['facebook_user_id'] as int?,
    );

Map<String, dynamic> _$AuthenticatedUserModelToJson(
    AuthenticatedUserModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['email'] = instance.email;
  writeNotNull('gender', instance.gender);
  val['public_id'] = instance.publicId;
  writeNotNull('connect_cost', instance.connectCost);
  writeNotNull('created_at', instance.createdAt?.toIso8601String());
  writeNotNull('date_of_birth', instance.dateOfBirth?.toIso8601String());
  writeNotNull('religion_name', instance.religionName);
  writeNotNull('marital_status', instance.maritalStatus);
  writeNotNull('visibility_status', instance.visibilityStatus);
  writeNotNull('google_user_id', instance.googleUserId);
  writeNotNull('facebook_user_id', instance.facebookUserId);
  return val;
}
