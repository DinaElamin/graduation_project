import 'package:json_annotation/json_annotation.dart';

part 'get_all_student_model.g.dart';

@JsonSerializable()
class GetAllStudentModel {
  String? id;
  String? userName;
  String? email;
  String? name;
  String? image;
  int? pClassId;

  GetAllStudentModel({
    this.id,
    this.userName,
    this.email,
    this.name,
    this.image,
    this.pClassId
  });

  factory GetAllStudentModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllStudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllStudentModelToJson(this);



}