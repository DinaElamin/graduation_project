// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_material_by_term_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllMaterialByTermIdModel _$GetAllMaterialByTermIdModelFromJson(
        Map<String, dynamic> json) =>
    GetAllMaterialByTermIdModel(
      id: json['id'] as int,
      name: json['name'] as String,
      m_grade: json['m_grade'] as int,
    );

Map<String, dynamic> _$GetAllMaterialByTermIdModelToJson(
        GetAllMaterialByTermIdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'm_grade': instance.m_grade,
    };
