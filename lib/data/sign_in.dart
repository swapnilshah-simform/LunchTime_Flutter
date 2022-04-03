import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class UserSignIn {
  final String email;
  final String password;

  UserSignIn({
    required this.email,
    required this.password,
  });

  factory UserSignIn.fromJson(Map<String, dynamic> json) =>
      _$UserSignInFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignInToJson(this);
}
