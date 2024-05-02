// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_grade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddGradeModel _$AddGradeModelFromJson(Map<String, dynamic> json) =>
    AddGradeModel(
      yearDto: json['yearDto'] == null
          ? null
          : YearDto.fromJson(json['yearDto'] as Map<String, dynamic>),
      firstSemesterMaterial: (json['firstSemesterMaterial'] as List<dynamic>?)
          ?.map(
              (e) => FirstSemesterMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
      secondSemesterMaterial: (json['secondSemesterMaterial'] as List<dynamic>?)
          ?.map(
              (e) => SecondSemesterMaterial.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddGradeModelToJson(AddGradeModel instance) =>
    <String, dynamic>{
      'yearDto': instance.yearDto,
      'firstSemesterMaterial': instance.firstSemesterMaterial,
      'secondSemesterMaterial': instance.secondSemesterMaterial,
    };

YearDto _$YearDtoFromJson(Map<String, dynamic> json) => YearDto(
      index: json['index'] as int?,
      yearName: json['yearName'] as String?,
    );

Map<String, dynamic> _$YearDtoToJson(YearDto instance) => <String, dynamic>{
      'index': instance.index,
      'yearName': instance.yearName,
    };

FirstSemesterMaterial _$FirstSemesterMaterialFromJson(
        Map<String, dynamic> json) =>
    FirstSemesterMaterial(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$FirstSemesterMaterialToJson(
        FirstSemesterMaterial instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

SecondSemesterMaterial _$SecondSemesterMaterialFromJson(
        Map<String, dynamic> json) =>
    SecondSemesterMaterial(
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SecondSemesterMaterialToJson(
        SecondSemesterMaterial instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
