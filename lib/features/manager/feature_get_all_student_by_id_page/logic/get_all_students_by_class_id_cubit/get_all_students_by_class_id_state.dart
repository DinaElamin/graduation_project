import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_students_by_class_id_state.freezed.dart';
@freezed
abstract class GetAllStudentsByClassIdState<T> with _$GetAllStudentsByClassIdState<T> {
  const factory GetAllStudentsByClassIdState.initial() = _Initial;
  const factory GetAllStudentsByClassIdState.loading() = Loading;
  const factory GetAllStudentsByClassIdState.success(T data) = Success<T>;
  const factory GetAllStudentsByClassIdState.error({required String error}) = Error;

}
