import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up.g.dart';

@JsonSerializable()
class UserSignUp {
  final String username;
  final String email;
  final String password;

  UserSignUp({
    required this.username,
    required this.email,
    required this.password,
  });

  factory UserSignUp.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpToJson(this);
}
