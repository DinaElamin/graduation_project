import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/edit_student_profile_repo.dart';
import 'edit_student_state.dart';

class EditStudentCubit extends Cubit<EditStudentState> {
  final EditStudentRepo editStudentRepo;
  EditStudentCubit(this.editStudentRepo) : super(const EditStudentState.initial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitAddStudentStates(String token,
      {required String Name,
      required String Email,
      required String NationalNum,
      required File Image,
      required int PClassId,
        required String userId,
      required int YearId}) async {
    emit(const EditStudentState.loading());
    final response = await editStudentRepo.editStudentData(
      userId: userId,
        token,
        Name: Name,
        Email: Email,
        NationalNum: NationalNum,
        Image: Image,
        PClassId: PClassId,
        YearId: YearId);

    response.when(
      success: (addTeacherData) {
        emit(EditStudentState.success(addTeacherData));
      },
      failure: (error) {
        emit(EditStudentState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
