import 'package:json_annotation/json_annotation.dart';
import 'package:ride_match/features/auth/domain/entities/user.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel extends User {
  UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.profileUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
