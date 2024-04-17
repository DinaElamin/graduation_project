import 'package:json_annotation/json_annotation.dart';

part 'get_all_teacher_model.g.dart';

@JsonSerializable()
class GetAllTeacherModel {
  String? id;
  String? userName;
  String? email;
  String? name;
  String? image;

  GetAllTeacherModel({
    this.id,
    this.userName,
    this.email,
    this.name,
    this.image,
  });

  factory GetAllTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllTeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllTeacherModelToJson(this);



}