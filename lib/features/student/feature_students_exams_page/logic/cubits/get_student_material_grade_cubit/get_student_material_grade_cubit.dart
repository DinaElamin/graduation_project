import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/get_student_material_grade_repo/get_student_material_grade_repo.dart';
import 'get_student_material_grade_state.dart';

class GetStudentMaterialGradeCubit extends Cubit<GetStudentMaterialGradeState> {
  final GetStudentMaterialGradeRepo getStudentMaterialGradeRepo;
  GetStudentMaterialGradeCubit(this.getStudentMaterialGradeRepo) : super(const GetStudentMaterialGradeState.initial());
  void emitStudentMaterialGrade(
      token,
      {required String studentId,
      required int termId})async {
    emit(const GetStudentMaterialGradeState.loading());
    final response = await getStudentMaterialGradeRepo.getStudentMaterialGradeRepo(
      token,
       studentId:studentId,
      termId:termId
    );
    response.when(
      success: (getMaterialByTeacherId) {
        emit(GetStudentMaterialGradeState.success(getMaterialByTeacherId));
      },
      failure: (error) {
        emit(GetStudentMaterialGradeState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
