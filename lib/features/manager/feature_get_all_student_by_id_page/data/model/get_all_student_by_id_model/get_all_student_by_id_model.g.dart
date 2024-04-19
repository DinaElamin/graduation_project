// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_student_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllStudentsByClassIdModel _$GetAllStudentsByClassIdModelFromJson(
        Map<String, dynamic> json) =>
    GetAllStudentsByClassIdModel(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$GetAllStudentsByClassIdModelToJson(
        GetAllStudentsByClassIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'name': instance.name,
      'image': instance.image,
    };
