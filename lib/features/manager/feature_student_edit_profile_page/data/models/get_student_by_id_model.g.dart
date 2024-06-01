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
      term: json['term'] == null
          ? null
          : Term.fromJson(json['term'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetStudentByIdModelToJson(
        GetStudentByIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'nationalNumber': instance.nationalNumber,
      'classId': instance.classId,
      'term': instance.term,
    };

Term _$TermFromJson(Map<String, dynamic> json) => Term(
      termId: json['termId'] as int?,
      termName: json['termName'] as String?,
    );

Map<String, dynamic> _$TermToJson(Term instance) => <String, dynamic>{
      'termId': instance.termId,
      'termName': instance.termName,
    };
