import '../../../../data/repos/get_all_teacher_repo/get_all_teacher_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_teacher_state.dart';

class GetAllTeacherDataCubit extends Cubit<GetAllTeacherDataState> {
  final GetAllTeacherRepo getAllTeacherRepo;
  GetAllTeacherDataCubit(this.getAllTeacherRepo) : super(const GetAllTeacherDataState.initial());

  void emitAllTeacherStates() async {
    emit(const GetAllTeacherDataState.loading());
    final response = await getAllTeacherRepo.getAllTeacherData();

    response.when(
      success: (getAllTeacherData) {
        emit(GetAllTeacherDataState.success(getAllTeacherData));
      },
      failure: (error) {
        emit(GetAllTeacherDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

  void searchByName(String name) async {
    emit(const GetAllTeacherDataState.loading());
    final response = await getAllTeacherRepo.searchTeacherByName(name);

    response.when(
      success: (getAllTeacherData) {
        emit(GetAllTeacherDataState.success(getAllTeacherData));
      },
      failure: (error) {
        emit(GetAllTeacherDataState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
