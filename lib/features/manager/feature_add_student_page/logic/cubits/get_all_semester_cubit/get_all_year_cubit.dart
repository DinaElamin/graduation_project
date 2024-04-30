import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/get_all_year_repo/get_all_year_repo.dart';
import 'get_all_year_state.dart';

class GetAllYearDataCubit extends Cubit<GetAllYearDataState> {
  final GetAllYearRepo getAllYearRepo;
  GetAllYearDataCubit(this.getAllYearRepo) : super(const GetAllYearDataState.initial());

  void emitAllYearStates() async {
    emit(const GetAllYearDataState.loading());
    final response = await getAllYearRepo.getAllYearData();

    response.when(
      success: (getAllYearData) {
        emit(GetAllYearDataState.success(getAllYearData));
      },
      failure: (error) {
        emit(GetAllYearDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
