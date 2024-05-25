import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_all_Teacher_by_id_state.freezed.dart';
@freezed
abstract class GetTeacherByIdState<T> with _$GetTeacherByIdState<T> {
  const factory GetTeacherByIdState.initial() = _Initial;
  const factory GetTeacherByIdState.loading() = Loading;
  const factory GetTeacherByIdState.success(T data) = Success<T>;
  const factory GetTeacherByIdState.error({required String error}) = Error;

}
