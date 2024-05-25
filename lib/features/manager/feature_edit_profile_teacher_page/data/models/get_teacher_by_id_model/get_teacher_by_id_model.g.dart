// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_teacher_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTeacherByIdModel _$GetTeacherByIdModelFromJson(Map<String, dynamic> json) =>
    GetTeacherByIdModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nationalNumber: json['nationalNumber'] as String?,
      subject: json['subject'] as String?,
      classes: (json['classes'] as List<dynamic>?)
          ?.map((e) => Classes.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTeacherByIdModelToJson(
        GetTeacherByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nationalNumber': instance.nationalNumber,
      'subject': instance.subject,
      'classes': instance.classes,
    };

Classes _$ClassesFromJson(Map<String, dynamic> json) => Classes(
      classId: json['classId'] as int?,
      className: json['className'] as String?,
    );

Map<String, dynamic> _$ClassesToJson(Classes instance) => <String, dynamic>{
      'classId': instance.classId,
      'className': instance.className,
    };
