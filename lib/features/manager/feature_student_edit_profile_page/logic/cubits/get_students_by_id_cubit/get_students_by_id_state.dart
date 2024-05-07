import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_students_by_id_state.freezed.dart';
@freezed
abstract class GetStudentByIdState<T> with _$GetStudentByIdState<T> {
  const factory GetStudentByIdState.initial() = _Initial;
  const factory GetStudentByIdState.loading() = Loading;
  const factory GetStudentByIdState.success(T data) = Success<T>;
  const factory GetStudentByIdState.error({required String error}) = Error;

}
