import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/add_material_grade_repo/add_material_degree_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_material_degree_state.dart';


class AddMaterialGradeCubit extends Cubit<AddMaterialDegreeState> {
  final AddMaterialDegreeRepo addMaterialDegreeRepo;
  AddMaterialGradeCubit(this.addMaterialDegreeRepo) : super(const AddMaterialDegreeState.initial());

  final formKey = GlobalKey<FormState>();

  void emitAddMaterialDegreeStates(
    String token, {
    required int materialid,
        required int M_grade,
  }) async {
    emit(const AddMaterialDegreeState.loading());
    final response = await addMaterialDegreeRepo.addMaterialDegreeRepo(
      token,
      materialid: materialid,
          M_grade: M_grade);

    response.when(
      success: (addTeacherData) {
        emit(AddMaterialDegreeState.success(addTeacherData));
      },
      failure: (error) {
        emit(
            AddMaterialDegreeState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
