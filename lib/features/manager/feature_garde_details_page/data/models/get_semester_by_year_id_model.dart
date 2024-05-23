import 'package:json_annotation/json_annotation.dart';

part 'get_semester_by_year_id_model.g.dart';
@JsonSerializable()
class GetSemesterByYearIdModel{
  final int id;
  final String termName;
  GetSemesterByYearIdModel({required this.id,required this.termName});

  Map<String , dynamic> toJson() => _$GetSemesterByYearIdModelToJson(this);
  factory GetSemesterByYearIdModel.fromJson(Map<String, dynamic> json) => _$GetSemesterByYearIdModelFromJson(json);


}
