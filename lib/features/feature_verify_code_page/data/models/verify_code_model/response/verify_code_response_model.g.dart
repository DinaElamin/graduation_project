// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResponseModel _$VerifyCodeResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyCodeResponseModel(
      expireAt: json['expireAt'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$VerifyCodeResponseModelToJson(
        VerifyCodeResponseModel instance) =>
    <String, dynamic>{
      'expireAt': instance.expireAt,
      'email': instance.email,
    };
