import 'package:json_annotation/json_annotation.dart';

part 'verify_code_response_model.g.dart';

@JsonSerializable()
class VerifyCodeResponseModel {
  String? expireAt;
  String? email;

  VerifyCodeResponseModel({this.expireAt, this.email});
  factory VerifyCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseModelToJson(this);

}