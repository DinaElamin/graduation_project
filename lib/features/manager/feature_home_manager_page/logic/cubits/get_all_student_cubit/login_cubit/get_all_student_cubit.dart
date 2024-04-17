import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/get_all_student_model/get_all_student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_student_state.dart';

class GetAllStudentDataCubit extends Cubit<GetAllStudentDataState> {
  final GetAllStudentRepo getAllStudentRepo;
  GetAllStudentDataCubit(this.getAllStudentRepo) : super(const GetAllStudentDataState.initial());

  void emitAllStudentStates() async {
    emit(const GetAllStudentDataState.loading());
    final response = await getAllStudentRepo.getAllStudentData();

    response.when(
      success: (getAllStudentData) {
        emit(GetAllStudentDataState.success(getAllStudentData));
      },
      failure: (error) {
        emit(GetAllStudentDataState.error(error: error.apiErrorModel.title ?? ''));
      },
    );
  }

}
