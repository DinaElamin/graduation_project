// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_teacher_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllTeacherModel _$GetAllTeacherModelFromJson(Map<String, dynamic> json) =>
    GetAllTeacherModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetAllTeacherModelToJson(GetAllTeacherModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
    };
