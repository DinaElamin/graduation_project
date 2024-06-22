import 'package:json_annotation/json_annotation.dart';
part 'get_violence_model.g.dart';

@JsonSerializable()
class GetViolenceModel {
  String? time;
  String? classname;
  GetViolenceModel({this.time, this.classname});
  factory GetViolenceModel.fromJson(Map<String, dynamic> json) =>
      _$GetViolenceModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetViolenceModelToJson(this);
}
