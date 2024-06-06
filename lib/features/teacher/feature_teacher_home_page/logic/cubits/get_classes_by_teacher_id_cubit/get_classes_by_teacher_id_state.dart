import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_classes_by_teacher_id_state.freezed.dart';
@freezed
abstract class GetClassesByTeacherIdState<T> with _$GetClassesByTeacherIdState<T> {
  const factory GetClassesByTeacherIdState.initial() = _Initial;
  const factory GetClassesByTeacherIdState.loading() = Loading;
  const factory GetClassesByTeacherIdState.success(T data) = Success<T>;
  const factory GetClassesByTeacherIdState.error({required String error}) = Error;

}
