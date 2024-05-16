import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_exam_state.freezed.dart';
@freezed
abstract class AddExamState<T> with _$AddExamState<T> {
  const factory AddExamState.initial() = _Initial;
  const factory AddExamState.loading() = Loading;
  const factory AddExamState.success(T data) = Success<T>;
  const factory AddExamState.error({required String error}) = Error;

}
