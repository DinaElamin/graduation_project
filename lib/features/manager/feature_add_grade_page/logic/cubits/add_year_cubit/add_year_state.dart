import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_year_state.freezed.dart';
@freezed
abstract class AddYearState<T> with _$AddYearState<T> {
  const factory AddYearState.initial() = _Initial;
  const factory AddYearState.loading() = Loading;
  const factory AddYearState.success(T data) = Success<T>;
  const factory AddYearState.error({required String error}) = Error;

}
