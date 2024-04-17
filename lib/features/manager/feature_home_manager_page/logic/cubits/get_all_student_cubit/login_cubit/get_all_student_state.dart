import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_teacher_state.freezed.dart';
@freezed
abstract class GetAllTeacherDataState<T> with _$GetAllTeacherDataState<T> {
  const factory GetAllTeacherDataState.initial() = _Initial;
  const factory GetAllTeacherDataState.loading() = Loading;
  const factory GetAllTeacherDataState.success(T data) = Success<T>;
  const factory GetAllTeacherDataState.error({required String error}) = Error;

}
