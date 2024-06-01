import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_details_model.g.dart';
@JsonSerializable()
class GetStudentGradesDetailsForOneMaterialModel {
  String? materialName;
  int? materialGrade;
  int? studentTotalGrade;
  List<Exams>? exams;

  GetStudentGradesDetailsForOneMaterialModel(
      {this.materialName,
        this.materialGrade,
        this.studentTotalGrade,
        this.exams});


  factory GetStudentGradesDetailsForOneMaterialModel.fromJson(Map<String, dynamic> json) =>
      _$GetStudentGradesDetailsForOneMaterialModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentGradesDetailsForOneMaterialModelToJson(this);

}
@JsonSerializable()

class Exams {
  int? examId;
  String? examName;
  int? examGrade;
  String? generalExamImage;
  int? studentExamGrade;

  Exams(
      {this.examId,
        this.examName,
        this.examGrade,
        this.generalExamImage,
        this.studentExamGrade});

  factory Exams.fromJson(Map<String, dynamic> json) =>
      _$ExamsFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsToJson(this);


}
