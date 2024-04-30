import 'package:json_annotation/json_annotation.dart';
part 'get_all_semester_model.g.dart';
@JsonSerializable()
class GetAllSemesterModel {
  int? id;
  String? termName;

  GetAllSemesterModel({this.id, this.termName});
  factory GetAllSemesterModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllSemesterModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllSemesterModelToJson(this);

}