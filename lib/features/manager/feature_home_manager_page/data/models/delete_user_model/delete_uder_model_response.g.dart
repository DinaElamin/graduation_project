// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_uder_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteUserModel _$DeleteUserModelFromJson(Map<String, dynamic> json) =>
    DeleteUserModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteUserModelToJson(DeleteUserModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
