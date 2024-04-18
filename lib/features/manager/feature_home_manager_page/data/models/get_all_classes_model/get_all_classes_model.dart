
import 'package:json_annotation/json_annotation.dart';

part 'get_all_classes_model.g.dart';

@JsonSerializable()
class GetAllClassesModel {
  int? classId;
  String? className;

  GetAllClassesModel({this.classId, this.className});
  factory GetAllClassesModel.fromJson(Map<String, dynamic> json) =>
      _$GetAllClassesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllClassesModelToJson(this);
}