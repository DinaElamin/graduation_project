// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStudentModel _$GetAllStudentModelFromJson(Map<String, dynamic> json) =>
    GetAllStudentModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      pClassId: json['pClassId'] as int?,
    );

Map<String, dynamic> _$GetAllStudentModelToJson(GetAllStudentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
      'pClassId': instance.pClassId,
    };
