import 'package:ride_match/features/auth/domain/contracts/i_auth.repository.dart';

class User {
  String id;
  String firstName;
  String lastName;
  String profileUrl;
  String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profileUrl,
    required this.email,
  });
}
