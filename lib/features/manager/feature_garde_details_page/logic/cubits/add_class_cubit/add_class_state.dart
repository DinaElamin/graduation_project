import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_class_state.freezed.dart';
@freezed
abstract class AddClassState<T> with _$AddClassState<T> {
  const factory AddClassState.initial() = _Initial;
  const factory AddClassState.loading() = Loading;
  const factory AddClassState.success(T data) = Success<T>;
  const factory AddClassState.error({required String error}) = Error;

}
