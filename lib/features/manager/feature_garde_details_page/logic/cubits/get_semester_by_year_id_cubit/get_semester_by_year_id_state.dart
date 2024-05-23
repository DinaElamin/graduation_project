import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_semester_by_year_id_state.freezed.dart';
@freezed
abstract class GetSemesterByIdState<T> with _$GetSemesterByIdState<T> {
  const factory GetSemesterByIdState.initial() = _Initial;
  const factory GetSemesterByIdState.loading() = Loading;
  const factory GetSemesterByIdState.success(T data) = Success<T>;
  const factory GetSemesterByIdState.error({required String error}) = Error;

}
