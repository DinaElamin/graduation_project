import 'package:json_annotation/json_annotation.dart';

part 'verify_code_pin_response_model.g.dart';

@JsonSerializable()
class VerifyPinCodeResponseModel {
  String? message;
  String? email;

  VerifyPinCodeResponseModel({this.message, this.email});
  factory VerifyPinCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPinCodeResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPinCodeResponseModelToJson(this);

}