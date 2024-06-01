// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_material_grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentMaterialGradeModel _$GetStudentMaterialGradeModelFromJson(
        Map<String, dynamic> json) =>
    GetStudentMaterialGradeModel(
      materialId: json['materialId'] as int?,
      materialName: json['materialName'] as String?,
      materialGrade: json['materialGrade'] as int?,
      studentTotalGrade: json['studentTotalGrade'] as int?,
    );

Map<String, dynamic> _$GetStudentMaterialGradeModelToJson(
        GetStudentMaterialGradeModel instance) =>
    <String, dynamic>{
      'materialId': instance.materialId,
      'materialName': instance.materialName,
      'materialGrade': instance.materialGrade,
      'studentTotalGrade': instance.studentTotalGrade,
    };
