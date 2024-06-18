import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_student_attendance_model.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetStudentAttendanceRepo {
  final ApiService _apiService;
  GetStudentAttendanceRepo(this._apiService);
  Future<ApiResult<List<GetStudentAttendanceModel>>> getStudentAttendanceRepo(
      token,
      {required String studentId}) async {
    try {
      // print('Fetching attendance for studentId: $studentId');
      // print('Using token: $token');
      final response = await _apiService.getStudentAttendance( token,studentId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
