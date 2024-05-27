import 'package:ablexa/features/student/feature_students_exams_page/data/repos/get_material_by_teacher_id_repo/get_material_by_teacher_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_material_by_teacher_id_state.dart';

class GetMaterialByTeacherIdCubit extends Cubit<GetMaterialByTeacherIdState> {
  final GetMaterialByTeacherIdRepo getMaterialByTeacherIdRepo;
  GetMaterialByTeacherIdCubit(this.getMaterialByTeacherIdRepo) : super(const GetMaterialByTeacherIdState.initial());
  void emitMaterialByTeacherIdStates(
      {required String TeacherId})async {
    emit(const GetMaterialByTeacherIdState.loading());
    final response = await getMaterialByTeacherIdRepo.getMaterialByTeacherId(
       TeacherId:  TeacherId,
    );
    response.when(
      success: (getMaterialByTeacherId) {
        emit(GetMaterialByTeacherIdState.success(getMaterialByTeacherId));
      },
      failure: (error) {
        emit(GetMaterialByTeacherIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
