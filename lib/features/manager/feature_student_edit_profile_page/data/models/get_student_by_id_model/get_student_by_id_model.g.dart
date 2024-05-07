// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_by_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentByIdModel _$GetStudentByIdModelFromJson(Map<String, dynamic> json) =>
    GetStudentByIdModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      nationalNumber: json['nationalNumber'] as String?,
      classId: json['classId'] as int?,
      year: json['year'] == null
          ? null
          : Year.fromJson(json['year'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStudentByIdModelToJson(
        GetStudentByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nationalNumber': instance.nationalNumber,
      'classId': instance.classId,
      'year': instance.year,
    };

Year _$YearFromJson(Map<String, dynamic> json) => Year(
      yearId: json['yearId'] as int?,
      yearName: json['yearName'] as String?,
    );

Map<String, dynamic> _$YearToJson(Year instance) => <String, dynamic>{
      'yearId': instance.yearId,
      'yearName': instance.yearName,
    };
