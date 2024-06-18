import 'package:json_annotation/json_annotation.dart';
part 'get_student_attendance_model.g.dart';

@JsonSerializable()
class GetStudentAttendanceModel {
  int? total;
  String? date_Day;

  GetStudentAttendanceModel({
    this.total,
    this.date_Day,
  });
  factory GetStudentAttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$GetStudentAttendanceModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetStudentAttendanceModelToJson(this);
}
