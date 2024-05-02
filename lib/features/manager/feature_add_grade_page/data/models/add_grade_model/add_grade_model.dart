import 'package:json_annotation/json_annotation.dart';
part 'add_grade_model.g.dart';
@JsonSerializable()
class AddGradeModel {
  YearDto? yearDto;
  List<FirstSemesterMaterial>? firstSemesterMaterial;
  List<SecondSemesterMaterial>? secondSemesterMaterial;

  AddGradeModel(
      {this.yearDto, this.firstSemesterMaterial, this.secondSemesterMaterial});
  factory AddGradeModel.fromJson(Map<String, dynamic> json) =>
      _$AddGradeModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddGradeModelToJson(this);
}
@JsonSerializable()

class YearDto {
  int? index;
  String? yearName;

  YearDto({this.index, this.yearName});

  factory YearDto.fromJson(Map<String, dynamic> json) =>
      _$YearDtoFromJson(json);

  Map<String, dynamic> toJson() => _$YearDtoToJson(this);


}
@JsonSerializable()

class FirstSemesterMaterial {
  String? name;

  FirstSemesterMaterial({this.name});
  factory FirstSemesterMaterial.fromJson(Map<String, dynamic> json) =>
      _$FirstSemesterMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$FirstSemesterMaterialToJson(this);

}
@JsonSerializable()

class SecondSemesterMaterial {
  String? name;

  SecondSemesterMaterial({this.name});

  factory SecondSemesterMaterial.fromJson(Map<String, dynamic> json) =>
      _$SecondSemesterMaterialFromJson(json);

  Map<String, dynamic> toJson() => _$SecondSemesterMaterialToJson(this);
}