import 'dart:io';
import 'package:ablexa/features/teacher/feature_add_exam_page/data/repos/add_exam_repo/add_exam_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_exam_state.dart';

class AddExamCubit extends Cubit<AddExamState> {
  final AddExamRepo addExamRepo;
  AddExamCubit(this.addExamRepo) : super(const AddExamState.initial());
  TextEditingController examNameController = TextEditingController();
  TextEditingController examGradeController = TextEditingController();
  TextEditingController subjectIdController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitAddExamStates(String token,String TeacherId,
      {required String Name,
        required int Exam_Grade,
        required int MaterialId,
        required File Image,
      })async {
    emit(const AddExamState.loading());
    final response = await addExamRepo.addExamData(
        token,
        TeacherId,
        Name: Name,
        Exam_Grade: Exam_Grade,
        MaterialId: MaterialId,
        Image: Image,
    );

    response.when(
      success: (addExamData) {
        emit(AddExamState.success(addExamData));
      },
      failure: (error) {
        emit(AddExamState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
