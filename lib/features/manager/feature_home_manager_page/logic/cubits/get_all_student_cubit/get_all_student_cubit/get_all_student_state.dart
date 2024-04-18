import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_student_state.freezed.dart';
@freezed
abstract class GetAllStudentDataState<T> with _$GetAllStudentDataState<T> {
  const factory GetAllStudentDataState.initial() = _Initial;
  const factory GetAllStudentDataState.loading() = Loading;
  const factory GetAllStudentDataState.success(T data) = Success<T>;
  const factory GetAllStudentDataState.error({required String error}) = Error;

}
