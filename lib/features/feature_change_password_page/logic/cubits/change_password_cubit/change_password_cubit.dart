import '../../../data/models/change_password_model/change_password_model.dart';
import '../../../data/repos/change_password_repo/change_password_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo changePasswordRepo;
  ChangePasswordCubit(this.changePasswordRepo) : super(const ChangePasswordState.initial());

  void emitChangePasswordStates(String email,ChangePasswordRequestModel changePasswordRequestModel) async {
    emit(const ChangePasswordState.loading());
    final response = await changePasswordRepo.changePasswordData(email, changePasswordRequestModel);

    response.when(
      success: (changePasswordData) {
        emit(ChangePasswordState.success(changePasswordData));
      },
      failure: (error) {
        emit(ChangePasswordState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
