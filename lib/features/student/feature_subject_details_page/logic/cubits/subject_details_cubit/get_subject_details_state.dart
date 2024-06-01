import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_subject_details_state.freezed.dart';
@freezed
abstract class SubjectDetailsState<T> with _$SubjectDetailsState<T> {
  const factory SubjectDetailsState.initial() = _Initial;
  const factory SubjectDetailsState.loading() = Loading;
  const factory SubjectDetailsState.success(T data) = Success<T>;
  const factory SubjectDetailsState.error({required String error}) = Error;

}
