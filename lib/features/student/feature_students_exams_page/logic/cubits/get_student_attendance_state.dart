import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_student_attendance_state.freezed.dart';
@freezed
abstract class GetStudentAttendanceState<T> with _$GetStudentAttendanceState<T> {
  const factory GetStudentAttendanceState.initial() = _Initial;
  const factory GetStudentAttendanceState.loading() = Loading;
  const factory GetStudentAttendanceState.success(T data) = Success<T>;
  const factory GetStudentAttendanceState.error({required String error}) = Error;

}