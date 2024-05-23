import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/get_semester_by_year_id_repo/get_semester_by_year_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_semester_by_year_id_state.dart';

class GetSemesterByIdCubit extends Cubit<GetSemesterByIdState> {
  final GetSemesterByIdRepo getSemesterByIdRepo;
  GetSemesterByIdCubit(this.getSemesterByIdRepo) : super(const GetSemesterByIdState.initial());

  void emitGetSemesterByYearIdStates({required int yearId}) async {
    emit(const GetSemesterByIdState.loading());
    final response = await getSemesterByIdRepo.getSemesterByYearId(
       yearId: yearId);

    response.when(
      success: (getSemesterByYearId) {
        emit(GetSemesterByIdState.success(getSemesterByYearId));
      },
      failure: (error) {
        emit(GetSemesterByIdState.error(error: error.apiErrorModel.errorMessage.toString()));
      },
    );
  }

}
