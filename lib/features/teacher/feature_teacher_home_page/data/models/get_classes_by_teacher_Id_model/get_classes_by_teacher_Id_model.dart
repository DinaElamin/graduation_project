import 'package:json_annotation/json_annotation.dart';

part 'get_classes_by_teacher_Id_model.g.dart';
@JsonSerializable()
class GetClassesByTeacherIdModel {
  int? id;
  String? name;

  GetClassesByTeacherIdModel({this.id, this.name});
  factory GetClassesByTeacherIdModel.fromJson(Map<String, dynamic> json) => _$GetClassesByTeacherIdModelFromJson(json);
  Map<String, dynamic> toJson() => _$GetClassesByTeacherIdModelToJson(this);

}