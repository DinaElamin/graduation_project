// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      status: json['status'] as String?,
      token: json['token'] as String?,
      expiration: json['expiration'] as String?,
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      nationalNum: json['nationalNum'] as String?,
      photo: json['photo'] as String?,
      classId: json['classId'] as String?,
      roleName: json['roleName'] as String?,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
      'expiration': instance.expiration,
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'nationalNum': instance.nationalNum,
      'photo': instance.photo,
      'classId': instance.classId,
      'roleName': instance.roleName,
    };
