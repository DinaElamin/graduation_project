import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repo/edit_student_profile_repo/edit_student_profile_repo.dart';
import 'edit_student_state.dart';

class EditStudentCubit extends Cubit<EditStudentState> {
  final EditStudentRepo editStudentRepo;
  EditStudentCubit(this.editStudentRepo) : super(const EditStudentState.initial());
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalIdController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitEditStudentStates(String token,String userId,
      {
        required String Name,
      required String Email,
      required String NationalNum,
      required File Image,
      required int PClassId,
      required int YearId}) async {
    emit(const EditStudentState.loading());
    final response = await editStudentRepo.editStudentData(

        token,
        userId,
        Name: Name,
        Email: Email,
        NationalNum: NationalNum,
        Image: Image,
        PClassId: PClassId,
        YearId: YearId);

    response.when(
      success: (editStudentData) {
        emit(EditStudentState.success(editStudentData));
      },
      failure: (error) {
        emit(EditStudentState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
