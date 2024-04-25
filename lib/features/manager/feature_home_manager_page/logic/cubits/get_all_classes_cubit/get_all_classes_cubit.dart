import '../../../data/repos/get_all_classes_repo/get_all_classes_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_classes_state.dart';

class GetAllClassesDataCubit extends Cubit<GetAllClassesDataState> {
  final GetAllClassesRepo getAllClassesRepo;
  GetAllClassesDataCubit(this.getAllClassesRepo) : super(const GetAllClassesDataState.initial());

  void emitAllClassesStates() async {
    emit(const GetAllClassesDataState.loading());
    final response = await getAllClassesRepo.getAllClassesData();

    response.when(
      success: (getAllClassesData) {
        emit(GetAllClassesDataState.success(getAllClassesData));
      },
      failure: (error) {
        emit(GetAllClassesDataState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
