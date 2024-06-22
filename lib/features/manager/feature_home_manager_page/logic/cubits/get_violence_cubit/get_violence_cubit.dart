import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_violence_cubit/get_violence_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/get_violence_repo/get_violence_repo.dart';


class GetViolenceCubit extends Cubit<GetViolenceDataState> {
  final GetViolenceRepo getViolenceRepo;
  GetViolenceCubit(this.getViolenceRepo) : super(const GetViolenceDataState.initial());

  void emitViolenceStates() async {
    emit(const GetViolenceDataState.loading());
    final response = await getViolenceRepo.getViolenceData();

    response.when(
      success: (getViolenceData) {
        emit(GetViolenceDataState.success(getViolenceData));
      },
      failure: (error) {
        emit(GetViolenceDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
