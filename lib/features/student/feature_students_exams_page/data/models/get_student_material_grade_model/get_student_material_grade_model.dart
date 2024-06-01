import 'package:json_annotation/json_annotation.dart';
part 'get_student_material_grade_model.g.dart';
@JsonSerializable()

class GetStudentMaterialGradeModel {
  int? materialId;
  String? materialName;
  int? materialGrade;
  int? studentTotalGrade;

  GetStudentMaterialGradeModel(
      {this.materialId,
        this.materialName,
        this.materialGrade,
        this.studentTotalGrade});
  factory GetStudentMaterialGradeModel.fromJson(Map<String, dynamic> json) =>
      _$GetStudentMaterialGradeModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentMaterialGradeModelToJson(this);


}
