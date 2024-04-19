import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_pin_code_state.freezed.dart';
@freezed
abstract class VerifyPinCodeState<T> with _$VerifyPinCodeState<T> {
  const factory VerifyPinCodeState.initial() = _Initial;
  const factory VerifyPinCodeState.loading() = Loading;
  const factory VerifyPinCodeState.success(T data) = Success<T>;
  const factory VerifyPinCodeState.error({required String error}) = Error;

}
