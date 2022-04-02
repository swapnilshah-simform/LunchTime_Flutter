// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUp _$UserSignUpFromJson(Map<String, dynamic> json) => UserSignUp(
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserSignUpToJson(UserSignUp instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };
