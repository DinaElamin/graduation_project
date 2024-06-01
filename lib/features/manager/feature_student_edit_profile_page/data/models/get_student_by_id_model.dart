import 'package:json_annotation/json_annotation.dart';
part 'get_student_by_id_model.g.dart';
@JsonSerializable()
class GetStudentByIdModel {
  String? id;
  String? name;
  String? email;
  String? nationalNumber;
  int? classId;
  Term? term;

  GetStudentByIdModel(
      {this.id,
        this.name,
        this.email,
        this.nationalNumber,
        this.classId,
        this.term});

  factory GetStudentByIdModel.fromJson(Map<String, dynamic> json) =>
      _$GetStudentByIdModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentByIdModelToJson(this);


}
@JsonSerializable()
class Term {
  int? termId;
  String? termName;

  Term({this.termId, this.termName});
  factory Term.fromJson(Map<String, dynamic> json) =>
      _$TermFromJson(json);

  Map<String, dynamic> toJson() => _$TermToJson(this);
}