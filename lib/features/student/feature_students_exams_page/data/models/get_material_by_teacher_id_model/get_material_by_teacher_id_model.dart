import 'package:json_annotation/json_annotation.dart';

part 'get_material_by_teacher_id_model.g.dart';
@JsonSerializable()

class GetMaterialByTeacherIdModel {
  int? id;
  String? name;
  int? m_grade;
  int? exams;
  int? termId;
  String? term;

  GetMaterialByTeacherIdModel(
      {this.id, this.name, this.m_grade, this.exams, this.termId, this.term});
  factory GetMaterialByTeacherIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetMaterialByTeacherIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetMaterialByTeacherIdModelToJson(this);


}
