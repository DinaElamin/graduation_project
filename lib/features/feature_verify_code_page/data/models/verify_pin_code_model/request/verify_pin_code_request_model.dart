import 'package:json_annotation/json_annotation.dart';

part 'verify_pin_code_request_model.g.dart';

@JsonSerializable()
class VerifyPinCodeRequestModel {
  String? pin;

  VerifyPinCodeRequestModel({this.pin});
  factory VerifyPinCodeRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerifyPinCodeRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPinCodeRequestModelToJson(this);

}