import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repos/get_all_student_repo/get_all_student_repo.dart';
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
