import 'package:ablexa/features/manager/feature_add_grade_page/data/repos/add_year_repo/add_year_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_year_state.dart';

class AddYearCubit extends Cubit<AddYearState> {
  final AddYearRepo addYearRepo;
  AddYearCubit(this.addYearRepo) : super(const AddYearState.initial());
  TextEditingController indexController = TextEditingController();
  TextEditingController yearNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitAddYearStates(
    String token, {
    required int Index,
    required String YearName,
    required List<String> FirstSemesterMaterial,
    required List<String> SecondSemesterMaterial,
  }) async {
    emit(const AddYearState.loading());
    final response = await addYearRepo.addYear(token,
        Index: Index,
        FirstSemesterMaterial: FirstSemesterMaterial,
        SecondSemesterMaterial: SecondSemesterMaterial,
        YearName: YearName);

    response.when(
      success: (addYearData) {
        emit(AddYearState.success(addYearData));
      },
      failure: (error) {
        emit(AddYearState.error(
            error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
