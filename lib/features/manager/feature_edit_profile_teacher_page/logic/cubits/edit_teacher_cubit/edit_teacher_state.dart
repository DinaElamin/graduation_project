import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_teacher_state.freezed.dart';
@freezed
abstract class EditTeacherState<T> with _$EditTeacherState<T> {
  const factory EditTeacherState.initial() = _Initial;
  const factory EditTeacherState.loading() = Loading;
  const factory EditTeacherState.success(T data) = Success<T>;
  const factory EditTeacherState.error({required String error}) = Error;

}
