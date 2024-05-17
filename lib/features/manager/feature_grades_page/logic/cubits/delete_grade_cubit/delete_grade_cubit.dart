import 'package:ablexa/features/manager/feature_grades_page/data/repos/delete_grade_repo/delete_grade_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'delete_grade_state.dart';

class DeleteGradeCubit extends Cubit<DeleteGradeState> {
  final DeleteGradeRepo deleteGradeRepo;
  DeleteGradeCubit(this.deleteGradeRepo) : super(const DeleteGradeState.initial());

  void emitDeleteGradeStates({required String token,required int yearId}) async {
    emit(const DeleteGradeState.loading());
    final response = await deleteGradeRepo.deleteGradeData(token: token,yearId: yearId);

    response.when(
      success: (deleteGradeData) {
        emit(DeleteGradeState.success(deleteGradeData));
      },
      failure: (error) {
        emit(DeleteGradeState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
