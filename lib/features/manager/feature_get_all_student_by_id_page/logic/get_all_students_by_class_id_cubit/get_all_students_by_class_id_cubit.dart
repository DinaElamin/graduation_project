
import '../../data/repos/get_all_student_by_class_id_repo/get_all_student_by_class_id_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_all_students_by_class_id_state.dart';

class GetAllStudentByClassIdCubit extends Cubit<GetAllStudentsByClassIdState> {
  final GetAllStudentsByClassIdRepo getAllStudentsByClassIdRepo;
  GetAllStudentByClassIdCubit(this.getAllStudentsByClassIdRepo)
      : super(const GetAllStudentsByClassIdState.initial());

  void emitAllStudentsByClassId({required int classId}) async {
    emit(const GetAllStudentsByClassIdState.loading());
    final response =
    await getAllStudentsByClassIdRepo.getAllStudentsByClassIdData(classId: classId);

    response.when(
      success: (getAllClassesData) {
        emit(GetAllStudentsByClassIdState.success(getAllClassesData));
      },
      failure: (error) {
        emit(GetAllStudentsByClassIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }

  void searchStudentByName(String name,int classId) async {
    emit(const GetAllStudentsByClassIdState.loading());

    final response = await getAllStudentsByClassIdRepo.searchStudentByName(name,classId);

    response.when(
      success: (searchedStudents) {
        emit(GetAllStudentsByClassIdState.success(searchedStudents));
      },
      failure: (error) {
        emit(GetAllStudentsByClassIdState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
