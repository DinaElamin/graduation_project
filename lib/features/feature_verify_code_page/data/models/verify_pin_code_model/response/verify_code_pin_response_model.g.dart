// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_pin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPinCodeResponseModel _$VerifyPinCodeResponseModelFromJson(
        Map<String, dynamic> json) =>
    VerifyPinCodeResponseModel(
      message: json['message'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$VerifyPinCodeResponseModelToJson(
        VerifyPinCodeResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'email': instance.email,
    };
