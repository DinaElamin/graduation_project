import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_violence_state.freezed.dart';
@freezed
abstract class GetViolenceDataState<T> with _$GetViolenceDataState<T> {
  const factory GetViolenceDataState.initial() = _Initial;
  const factory GetViolenceDataState.loading() = Loading;
  const factory GetViolenceDataState.success(T data) = Success<T>;
  const factory GetViolenceDataState.error({required String error}) = Error;

}
