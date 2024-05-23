import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/get_all_material_by_term_id_repo/get_all_material_by_term_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_material_by_term_id_state.dart';

class GetAllMaterialByTermIdCubit extends Cubit<GetAllMaterialByTermIdState> {
  final GetAllMaterialByTermIdRepo getAllMaterialByTermIdRepo;
  GetAllMaterialByTermIdCubit(this.getAllMaterialByTermIdRepo) : super(const GetAllMaterialByTermIdState.initial());

  void emitGetAllMaterialByTermIdStates({required int termId}) async {
    emit(const GetAllMaterialByTermIdState.loading());
    final response = await getAllMaterialByTermIdRepo.getAllMaterialByTermId(
       termId: termId);

    response.when(
      success: (getAllMaterialByTermId) {
        emit(GetAllMaterialByTermIdState.success(getAllMaterialByTermId));
      },
      failure: (error) {
        emit(GetAllMaterialByTermIdState.error(error: error.apiErrorModel.errorMessage.toString()));
      },
    );
  }

}
