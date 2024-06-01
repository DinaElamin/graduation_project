import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/add_grade_repo/add_grade.dart';
import 'add_grade_state.dart';

class AddGradeCubit extends Cubit<AddGradeState> {
  final AddGradeRepo addGradeRepo;
  AddGradeCubit(this.addGradeRepo) : super(const AddGradeState.initial());
  TextEditingController studentGradeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitAddGradeStates(String token,
      {required int ExamId,
      required String StudentId,
      required String TeacherId,
      required int Student_Grade}) async {
    emit(const AddGradeState.loading());
    final response = await addGradeRepo.addGradeRepo(token,
        ExamId: ExamId,
        Student_Grade: Student_Grade,
        TeacherId: TeacherId,
        StudentId: StudentId);

    response.when(
      success: (addTeacherData) {
        emit(AddGradeState.success(addTeacherData));
      },
      failure: (error) {
        emit(
            AddGradeState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
