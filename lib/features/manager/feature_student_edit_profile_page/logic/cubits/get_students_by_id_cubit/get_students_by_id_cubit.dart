import 'package:ablexa/features/manager/feature_student_edit_profile_page/data/repos/get_student_by_id_repo/get_student_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_students_by_id_state.dart';

class GetStudentByIdCubit extends Cubit<GetStudentByIdState> {
  final GetStudentByIdRepo getStudentByIdRepo;
  GetStudentByIdCubit(this.getStudentByIdRepo) : super(const GetStudentByIdState.initial());

  void emitAllStudentsByClassId({required String studentId}) async {
    emit(const GetStudentByIdState.loading());
    final response = await getStudentByIdRepo.getStudentsByIdData(studentId: studentId);

    response.when(
      success: (getStudentByIdData) {
        emit(GetStudentByIdState.success(getStudentByIdData));
      },
      failure: (error) {
        emit(GetStudentByIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

}
