import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_teacher_state.freezed.dart';
@freezed
abstract class AddTeacherState<T> with _$AddTeacherState<T> {
  const factory AddTeacherState.initial() = _Initial;
  const factory AddTeacherState.loading() = Loading;
  const factory AddTeacherState.success(T data) = Success<T>;
  const factory AddTeacherState.error({required String error}) = Error;

}
