import 'package:json_annotation/json_annotation.dart';
part 'change_password_model.g.dart';
@JsonSerializable()
class ChangePasswordRequestModel {
  String? newPassword;
  String? confirmNewPassword;

  ChangePasswordRequestModel({this.newPassword,this.confirmNewPassword});
  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordRequestModelToJson(this);

}