import 'package:json_annotation/json_annotation.dart';
part 'get_student_by_id_model.g.dart';
@JsonSerializable()
class GetStudentByIdModel {
  String? id;
  String? name;
  String? email;
  String? nationalNumber;
  int? classId;
  Year? year;

  GetStudentByIdModel(
      {this.id,
        this.name,
        this.email,
        this.nationalNumber,
        this.classId,
        this.year});

  factory GetStudentByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetStudentByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentByIdModelToJson(this);


}
@JsonSerializable()
class Year {
  int? yearId;
  String? yearName;

  Year({this.yearId, this.yearName});
  factory Year.fromJson(Map<String, dynamic> json) =>
      _$YearFromJson(json);

  Map<String, dynamic> toJson() => _$YearToJson(this);
}