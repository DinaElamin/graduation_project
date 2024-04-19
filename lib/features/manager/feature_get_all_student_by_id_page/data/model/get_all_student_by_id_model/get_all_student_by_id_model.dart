import 'package:json_annotation/json_annotation.dart';
part 'get_all_student_by_id_model.g.dart';
@JsonSerializable()
class GetAllStudentsByClassIdModel {
  String? id;
  String? userName;
  String? email;
  String? name;
  String? image;

  GetAllStudentsByClassIdModel(
      {this.id, this.userName, this.email, this.name, this.image});
  factory GetAllStudentsByClassIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllStudentsByClassIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllStudentsByClassIdModelToJson(this);
}