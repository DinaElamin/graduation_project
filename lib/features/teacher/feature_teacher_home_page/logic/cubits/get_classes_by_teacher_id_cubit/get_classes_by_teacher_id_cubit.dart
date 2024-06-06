
import 'package:ablexa/features/teacher/feature_teacher_home_page/data/repos/get_classes_by_teacher_id_repo/get_classes_by_teacher_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_classes_by_teacher_id_state.dart';

class GetClassesByTeacherIdCubit extends Cubit<GetClassesByTeacherIdState> {
  final GetClassesByTeacherId getClassesByTeacherIdRepo;
  GetClassesByTeacherIdCubit(this.getClassesByTeacherIdRepo)
      : super(const GetClassesByTeacherIdState.initial());

  void emitAllStudentsByClassId({required String token,required String teacherId}) async {
    emit(const GetClassesByTeacherIdState.loading());
    final response =
    await getClassesByTeacherIdRepo.getClassesByTeacherId(token: token,teacherId: teacherId);

    response.when(
      success: (getAllClassesByTeacherId) {
        emit(GetClassesByTeacherIdState.success(getAllClassesByTeacherId));
      },
      failure: (error) {
        emit(GetClassesByTeacherIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }


}
