import '../../../data/models/verify_code_model/request/verify_code_request_model.dart';
import '../../../data/repos/verify_code_repo/verify_code_repo.dart';
import 'verify_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final VerifyCodeRepo verifyCodeRepo;
  VerifyCodeCubit(this.verifyCodeRepo) : super(const VerifyCodeState.initial());

  void emitVerifyCodeStates(VerifyCodeRequestModel verifyCodeRequestModel) async {
    emit(const VerifyCodeState.loading());
    final response = await verifyCodeRepo.verifyCodeData(verifyCodeRequestModel);

    response.when(
      success: (verifyCodeData) {
        emit(VerifyCodeState.success(verifyCodeData));
      },
      failure: (error) {
        emit(VerifyCodeState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
