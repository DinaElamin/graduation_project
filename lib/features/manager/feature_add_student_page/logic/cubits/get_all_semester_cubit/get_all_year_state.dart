import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_semester_state.freezed.dart';
@freezed
abstract class GetAllSemesterDataState<T> with _$GetAllSemesterDataState<T> {
  const factory GetAllSemesterDataState.initial() = _Initial;
  const factory GetAllSemesterDataState.loading() = Loading;
  const factory GetAllSemesterDataState.success(T data) = Success<T>;
  const factory GetAllSemesterDataState.error({required String error}) = Error;

}
