import 'package:json_annotation/json_annotation.dart';
part 'get_teacher_by_id_model.g.dart';
@JsonSerializable()
class GetTeacherByIdModel {
  String? id;
  String? name;
  String? email;
  String? nationalNumber;
  String? subject;
  List<Classes>? classes;

  GetTeacherByIdModel(
      {this.id,
        this.name,
        this.email,
        this.nationalNumber,
        this.subject,
        this.classes});

  factory GetTeacherByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetTeacherByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetTeacherByIdModelToJson(this);
}
@JsonSerializable()

class Classes {
  int? classId;
  String? className;

  Classes({this.classId, this.className});

  factory Classes.fromJson(Map<String, dynamic> json) =>
      _$ClassesFromJson(json);

  Map<String, dynamic> toJson() => _$ClassesToJson(this);
}