import 'package:json_annotation/json_annotation.dart';
part 'get_all-matrial_model.g.dart';
@JsonSerializable()
class GetAllMaterialModel {
  String? subject_Name;

  GetAllMaterialModel({this.subject_Name});
  factory GetAllMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllMaterialModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllMaterialModelToJson(this);

}