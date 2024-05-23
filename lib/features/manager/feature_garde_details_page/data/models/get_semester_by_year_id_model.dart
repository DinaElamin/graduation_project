import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';
@JsonSerializable()
class GetSemesterByYearIdModel{
  final int id;
  final String termName;
  GetSemesterByYearIdModel({required this.id,required this.termName});

  Map<String , dynamic> toJson() => _$LoginRequestModelToJson(this);

}
