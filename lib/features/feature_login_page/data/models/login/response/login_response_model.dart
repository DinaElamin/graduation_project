import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';
@JsonSerializable()
class LoginResponseModel {
  String? status;
  String? token;
  String? expiration;
  String? id;
  String? email;
  String? username;
  String? nationalNum;
  String? photo;
  String? classId;
  String? roleName;

  LoginResponseModel(
      {this.status,
        this.token,
        this.expiration,
        this.id,
        this.email,
        this.username,
        this.nationalNum,
        this.photo,
        this.classId,
        this.roleName});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}