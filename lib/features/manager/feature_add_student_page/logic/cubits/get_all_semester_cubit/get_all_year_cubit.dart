import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/get_all_semester_repo/get_all_semester_repo.dart';
import 'get_all_semester_state.dart';

class GetAllSemesterDataCubit extends Cubit<GetAllSemesterDataState> {
  final GetAllSemesterRepo getAllSemesterRepo;
  GetAllSemesterDataCubit(this.getAllSemesterRepo) : super(const GetAllSemesterDataState.initial());

  void emitAllSemesterStates() async {
    emit(const GetAllSemesterDataState.loading());
    final response = await getAllSemesterRepo.getAllSemesterData();

    response.when(
      success: (getAllSemesterData) {
        emit(GetAllSemesterDataState.success(getAllSemesterData));
      },
      failure: (error) {
        emit(GetAllSemesterDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
