import '../../../data/models/verify_pin_code_model/request/verify_pin_code_request_model.dart';
import 'verify_pin_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/verify_pin_code_repo/verify_code_repo.dart';
class VerifyPinCodeCubit extends Cubit<VerifyPinCodeState> {
  final VerifyPinCodeRepo verifyPinCodeRepo;
  VerifyPinCodeCubit(this.verifyPinCodeRepo) : super(const VerifyPinCodeState.initial());

  void emitVerifyCodeStates(String email,VerifyPinCodeRequestModel verifyPinCodeRequestModel) async {
    emit(const VerifyPinCodeState.loading());
    final response = await verifyPinCodeRepo.verifyCodeData(email,verifyPinCodeRequestModel);

    response.when(
      success: (getVerifyPinCodeData) {
        emit(VerifyPinCodeState.success(getVerifyPinCodeData));
      },
      failure: (error) {
        emit(VerifyPinCodeState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
