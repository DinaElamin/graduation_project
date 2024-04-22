import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/add_teacher_model/add_teacher_model.dart';
import '../../../data/repos/add_teacher_repo/add_teacher_repo.dart';
import 'get_all_classes_state.dart';

class AddTeacherCubit extends Cubit<AddTeacherState> {
  final AddTeacherRepo addTeacherRepo;
  AddTeacherCubit(this.addTeacherRepo) : super(const AddTeacherState.initial());

  void emitAddTeacherStates(String token,
      {required String Name,required String Email,required String NationalNum,required File Image}) async {
    emit(const AddTeacherState.loading());
    final response = await addTeacherRepo.addTeacherData(token,Name: Name,Email: Email,NationalNum: NationalNum,Image: Image);

    response.when(
      success: (addTeacherData) {
        emit(AddTeacherState.success(addTeacherData));
      },
      failure: (error) {
        emit(AddTeacherState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
