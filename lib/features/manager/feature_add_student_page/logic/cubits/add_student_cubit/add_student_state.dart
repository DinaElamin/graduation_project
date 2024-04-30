import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_student_state.freezed.dart';
@freezed
abstract class AddStudentState<T> with _$AddStudentState<T> {
  const factory AddStudentState.initial() = _Initial;
  const factory AddStudentState.loading() = Loading;
  const factory AddStudentState.success(T data) = Success<T>;
  const factory AddStudentState.error({required String error}) = Error;

}
