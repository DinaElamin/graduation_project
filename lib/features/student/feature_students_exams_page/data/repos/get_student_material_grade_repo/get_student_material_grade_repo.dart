import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_student_material_grade_model/get_student_material_grade_model.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetStudentMaterialGradeRepo {
  final ApiService _apiService;
  GetStudentMaterialGradeRepo(this._apiService);
  Future<ApiResult<List<GetStudentMaterialGradeModel>>> getStudentMaterialGradeRepo(
      token,
      {required String studentId,
      required int termId}) async {
    try {
      final response = await _apiService.getStudentMaterialGrade(token,studentId,termId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
