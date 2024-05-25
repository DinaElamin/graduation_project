
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/data/repos/get_teacher_by_class_id_repo/get_all_student_by_class_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'get_all_Teacher_by_id_state.dart';

class GetTeacherByIdCubit extends Cubit<GetTeacherByIdState> {
  final GetTeacherByIdRepo getTeacherByIdRepo;
  GetTeacherByIdCubit(this.getTeacherByIdRepo)
      : super(const GetTeacherByIdState.initial());

  void emitAllTeacherById({required String teacherId}) async {
    emit(const GetTeacherByIdState.loading());
    final response =
    await getTeacherByIdRepo.getAllTeacherIdData(teacherId: teacherId);

    response.when(
      success: (getAllClassesData) {
        emit(GetTeacherByIdState.success(getAllClassesData));
      },
      failure: (error) {
        emit(GetTeacherByIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }


}
