import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/delete_user_repo/delete_user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'delete_user_state_state.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  final DeleteUserRepo deleteUserRepo;
  DeleteUserCubit(this.deleteUserRepo) : super(const DeleteUserState.initial());

  void emitDeleteUserStates({required String token,required String userId}) async {
    emit(const DeleteUserState.loading());
    final response = await deleteUserRepo.deleteUserData(token: token,userId: userId);

    response.when(
      success: (deleteUserData) {
        emit(DeleteUserState.success(deleteUserData));
      },
      failure: (error) {
        emit(DeleteUserState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
