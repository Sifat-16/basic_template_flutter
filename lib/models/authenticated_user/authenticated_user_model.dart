import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authenticated_user_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class AuthenticatedUserModel {
  AuthenticatedUserModel({
    this.id = '',
    this.name = 'Guest',
    this.email = '',
    this.gender = 'Unknown',
    this.publicId = 0,
    this.connectCost = 1,
    //
    this.createdAt,
    this.dateOfBirth,
    this.religionName,
    this.maritalStatus,
    this.visibilityStatus = 'PRIVATE',
    //
    this.googleUserId,
    this.facebookUserId,
    //
    // this.roles,
    // this.permissions,
  });

  @HiveField(0, defaultValue: '')
  final String id;
  @HiveField(5, defaultValue: 'Guest')
  final String? name;
  @HiveField(1, defaultValue: '')
  final String email;
  @HiveField(11, defaultValue: 'Unknown')
  final String? gender;
  @HiveField(2, defaultValue: 0)
  final int publicId;
  @HiveField(31, defaultValue: 1)
  final int? connectCost;

  //
  @HiveField(7, defaultValue: null)
  final DateTime? createdAt;
  @HiveField(10, defaultValue: null)
  final DateTime? dateOfBirth;
  @HiveField(30, defaultValue: null)
  final String? religionName;

  //
  @HiveField(15, defaultValue: null)
  final String? maritalStatus;
  @HiveField(9, defaultValue: 'PRIVATE')
  final String? visibilityStatus;

  //
  @HiveField(28, defaultValue: null)
  final int? googleUserId;
  @HiveField(29, defaultValue: null)
  final int? facebookUserId;



  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticatedUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticatedUserModelToJson(this);
}

