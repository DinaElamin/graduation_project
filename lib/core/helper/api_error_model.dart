import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  String? type;
  String? title;
  int? status;
  Errors? errors;
  String? traceId;
  ApiErrorModel({this.type, this.status, this.title, this.traceId});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
@JsonSerializable()
class Errors {
  List<String>? nationalNum;

  Errors({this.nationalNum});

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
