import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_year_state.freezed.dart';
@freezed
abstract class GetAllYearDataState<T> with _$GetAllYearDataState<T> {
  const factory GetAllYearDataState.initial() = _Initial;
  const factory GetAllYearDataState.loading() = Loading;
  const factory GetAllYearDataState.success(T data) = Success<T>;
  const factory GetAllYearDataState.error({required String error}) = Error;

}
