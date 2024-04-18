import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_classes_state.freezed.dart';
@freezed
abstract class GetAllClassesDataState<T> with _$GetAllClassesDataState<T> {
  const factory GetAllClassesDataState.initial() = _Initial;
  const factory GetAllClassesDataState.loading() = Loading;
  const factory GetAllClassesDataState.success(T data) = Success<T>;
  const factory GetAllClassesDataState.error({required String error}) = Error;

}
