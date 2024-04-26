import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state_state.freezed.dart';
@freezed
abstract class DeleteUserState<T> with _$DeleteUserState<T> {
  const factory DeleteUserState.initial() = _Initial;
  const factory DeleteUserState.loading() = Loading;
  const factory DeleteUserState.success(T data) = Success<T>;
  const factory DeleteUserState.error({required String error}) = Error;

}
