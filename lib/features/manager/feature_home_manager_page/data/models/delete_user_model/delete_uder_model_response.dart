import 'package:json_annotation/json_annotation.dart';
part 'delete_uder_model_response.g.dart';
@JsonSerializable()
class DeleteUserModel {
  int? status;
  String? message;

  DeleteUserModel({this.status, this.message});

  factory DeleteUserModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteUserModelToJson(this);
}