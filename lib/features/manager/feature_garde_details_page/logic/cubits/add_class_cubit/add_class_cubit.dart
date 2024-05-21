import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/add_class_repo/add_class_repo.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_class_state.dart';

class AddClassCubit extends Cubit<AddClassState> {
  final AddClassRepo addClassRepo;
  AddClassCubit(this.addClassRepo) : super(const AddClassState.initial());

  final formKey = GlobalKey<FormState>();

  void emitAddClassStates(
    String token, {
    required String name,
  }) async {
    emit(const AddClassState.loading());
    final response = await addClassRepo.addClassRepo(
      token,
      name: name,
    );

    response.when(
      success: (addTeacherData) {
        emit(AddClassState.success(addTeacherData));
      },
      failure: (error) {
        emit(
            AddClassState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
