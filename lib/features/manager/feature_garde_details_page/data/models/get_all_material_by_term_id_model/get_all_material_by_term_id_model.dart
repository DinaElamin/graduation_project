import 'package:json_annotation/json_annotation.dart';

part 'get_all_material_by_term_id_model.g.dart';
@JsonSerializable()
class GetAllMaterialByTermIdModel{
  final int id;
  final String name;
  final int m_grade;
  GetAllMaterialByTermIdModel({required this.id,required this.name,required this.m_grade});

  Map<String , dynamic> toJson() => _$GetAllMaterialByTermIdModelToJson(this);
  factory GetAllMaterialByTermIdModel.fromJson(Map<String, dynamic> json) => _$GetAllMaterialByTermIdModelFromJson(json);


}
