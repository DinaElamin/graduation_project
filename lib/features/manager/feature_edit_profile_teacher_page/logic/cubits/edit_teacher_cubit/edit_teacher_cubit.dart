import 'dart:io';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/data/repos/edit_teacher_profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'edit_teacher_state.dart';

class EditTeacherCubit extends Cubit<EditTeacherState> {
  final EditTeacherRepo editTeacherRepo;
  EditTeacherCubit(this.editTeacherRepo) : super(const EditTeacherState.initial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitEditTeacherStates(String token,String userId,
      {
        required String Name,
      required String Email,
      required String NationalNum,
      required File Image,
      required List<String> AssignClassId,
        required String SubjectName,
      }) async {
    emit(const EditTeacherState.loading());
    final response = await editTeacherRepo.editTeacherData(
        token,
        userId,
        Name: Name,
        Email: Email,
        NationalNum: NationalNum,
        Image: Image,
    AssignClassId: AssignClassId,
      SubjectName:SubjectName
    );

    response.when(
      success: (editStudentData) {
        emit(EditTeacherState.success(editStudentData));
      },
      failure: (error) {
        emit(EditTeacherState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
