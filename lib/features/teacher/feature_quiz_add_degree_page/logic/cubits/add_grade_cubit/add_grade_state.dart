import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_grade_state.freezed.dart';
@freezed
abstract class AddGradeState<T> with _$AddGradeState<T> {
  const factory AddGradeState.initial() = _Initial;
  const factory AddGradeState.loading() = Loading;
  const factory AddGradeState.success(T data) = Success<T>;
  const factory AddGradeState.error({required String error}) = Error;

}
