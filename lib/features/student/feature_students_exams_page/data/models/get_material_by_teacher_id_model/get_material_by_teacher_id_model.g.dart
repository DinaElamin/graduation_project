// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_material_by_teacher_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMaterialByTeacherIdModel _$GetMaterialByTeacherIdModelFromJson(
        Map<String, dynamic> json) =>
    GetMaterialByTeacherIdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      m_grade: json['m_grade'] as int?,
      exams: json['exams'] as int?,
      termId: json['termId'] as int?,
      term: json['term'] as String?,
    );

Map<String, dynamic> _$GetMaterialByTeacherIdModelToJson(
        GetMaterialByTeacherIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'm_grade': instance.m_grade,
      'exams': instance.exams,
      'termId': instance.termId,
      'term': instance.term,
    };
