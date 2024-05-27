import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_material_by_teacher_id_state.freezed.dart';
@freezed
abstract class GetMaterialByTeacherIdState<T> with _$GetMaterialByTeacherIdState<T> {
  const factory GetMaterialByTeacherIdState.initial() = _Initial;
  const factory GetMaterialByTeacherIdState.loading() = Loading;
  const factory GetMaterialByTeacherIdState.success(T data) = Success<T>;
  const factory GetMaterialByTeacherIdState.error({required String error}) = Error;

}
