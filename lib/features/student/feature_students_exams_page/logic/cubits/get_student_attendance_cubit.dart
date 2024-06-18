
import 'package:ablexa/features/student/feature_students_exams_page/data/repos/get_student_attendance_repo/get_student_attendance_repo.dart';
import 'package:ablexa/features/student/feature_students_exams_page/logic/cubits/get_student_attendance_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class GetStudentAttendanceCubit extends Cubit<GetStudentAttendanceState> {
  final GetStudentAttendanceRepo getStudentAttendanceRepo;
  GetStudentAttendanceCubit(this.getStudentAttendanceRepo)
      : super(const GetStudentAttendanceState.initial());
  void emitStudentAttendance( token,{required String studentId}) async {
    emit(const GetStudentAttendanceState.loading());
    final response =
        await getStudentAttendanceRepo.getStudentAttendanceRepo(
           token, studentId: studentId);
    response.when(
      success: (getStudentAttendance) {
        emit(GetStudentAttendanceState.success(getStudentAttendance));
      },
      failure: (error) {
        emit(GetStudentAttendanceState.error(
            error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
