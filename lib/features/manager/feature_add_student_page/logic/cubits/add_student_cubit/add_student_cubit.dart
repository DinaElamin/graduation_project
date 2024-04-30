import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../../../data/repos/add_student_repo/add_student_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_student_state.dart';

class AddStudentCubit extends Cubit<AddStudentState> {
  final AddStudentRepo addStudentRepo;
  AddStudentCubit(this.addStudentRepo) : super(const AddStudentState.initial());
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
      required int TermId}) async {
    emit(const AddStudentState.loading());
    final response = await addStudentRepo.addStudentData(token,
        Name: Name,
        Email: Email,
        NationalNum: NationalNum,
        Image: Image,
        PClassId: PClassId,
        TermId: TermId);

    response.when(
      success: (addTeacherData) {
        emit(AddStudentState.success(addTeacherData));
      },
      failure: (error) {
        emit(AddStudentState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
