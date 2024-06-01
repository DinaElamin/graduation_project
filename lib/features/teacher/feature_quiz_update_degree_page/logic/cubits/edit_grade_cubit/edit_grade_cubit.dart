import 'package:ablexa/features/teacher/feature_quiz_update_degree_page/data/repos/edit_grade_repo/edit_grade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_grade_state.dart';

class EditGradeCubit extends Cubit<EditGradeState> {
  final EditGradeRepo editGradeRepo;
  EditGradeCubit(this.editGradeRepo) : super(const EditGradeState.initial());
  TextEditingController studentGradeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitEditGradeStates(String token,
      {required int studentGradeId ,required int ExamId,required String StudentId,required String TeacherId,required int Student_Grade}) async {
    emit(const EditGradeState.loading());
    final response = await editGradeRepo.editGradeRepo(
        token,
        studentGradeId: studentGradeId,
        ExamId: ExamId,
      StudentId: StudentId,
      TeacherId: TeacherId,
        Student_Grade: Student_Grade,

     );

    response.when(
      success: (addTeacherData) {
        emit(EditGradeState.success(addTeacherData));
      },
      failure: (error) {
        emit(
            EditGradeState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
