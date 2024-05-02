import 'package:ablexa/features/manager/feature_add_teacher_page/data/repos/get_all_matrial_repo/get_all_matrial_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_all_material_state.dart';


class GetAllMaterialDataCubit extends Cubit<GetAllMaterialDataState> {
  final GetAllMaterialRepo getAllMaterialRepo;
  GetAllMaterialDataCubit(this.getAllMaterialRepo) : super(const GetAllMaterialDataState.initial());

  void emitAllMaterialStates() async {
    emit(const GetAllMaterialDataState.loading());
    final response = await getAllMaterialRepo.getAllMaterialData();

    response.when(
      success: (getAllMaterialData) {
        emit(GetAllMaterialDataState.success(getAllMaterialData));
      },
      failure: (error) {
        emit(GetAllMaterialDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
