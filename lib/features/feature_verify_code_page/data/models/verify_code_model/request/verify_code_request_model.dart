import 'package:json_annotation/json_annotation.dart';

part 'verify_code_request_model.g.dart';

@JsonSerializable()
class VerifyCodeRequestModel {
  String? email;

  VerifyCodeRequestModel({this.email});
  factory VerifyCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeRequestModelToJson(this);

}