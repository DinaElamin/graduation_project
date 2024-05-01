import 'package:json_annotation/json_annotation.dart';
part 'get_all_year_model.g.dart';
@JsonSerializable()
class GetAllYearModel {
  int? id;
  String? name;

  GetAllYearModel({this.id, this.name});
  factory GetAllYearModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllYearModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllYearModelToJson(this);

}