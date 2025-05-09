import 'package:ride_match/core/enums/user_role.enum.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String email;
  UserRole role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
  });
}
