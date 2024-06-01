// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentGradesDetailsForOneMaterialModel
    _$GetStudentGradesDetailsForOneMaterialModelFromJson(
            Map<String, dynamic> json) =>
        GetStudentGradesDetailsForOneMaterialModel(
          materialName: json['materialName'] as String?,
          materialGrade: json['materialGrade'] as int?,
          studentTotalGrade: json['studentTotalGrade'] as int?,
          exams: (json['exams'] as List<dynamic>?)
              ?.map((e) => Exams.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$GetStudentGradesDetailsForOneMaterialModelToJson(
        GetStudentGradesDetailsForOneMaterialModel instance) =>
    <String, dynamic>{
      'materialName': instance.materialName,
      'materialGrade': instance.materialGrade,
      'studentTotalGrade': instance.studentTotalGrade,
      'exams': instance.exams,
    };

Exams _$ExamsFromJson(Map<String, dynamic> json) => Exams(
      examId: json['examId'] as int?,
      examName: json['examName'] as String?,
      examGrade: json['examGrade'] as int?,
      generalExamImage: json['generalExamImage'] as String?,
      studentExamGrade: json['studentExamGrade'] as int?,
    );

Map<String, dynamic> _$ExamsToJson(Exams instance) => <String, dynamic>{
      'examId': instance.examId,
      'examName': instance.examName,
      'examGrade': instance.examGrade,
      'generalExamImage': instance.generalExamImage,
      'studentExamGrade': instance.studentExamGrade,
    };
