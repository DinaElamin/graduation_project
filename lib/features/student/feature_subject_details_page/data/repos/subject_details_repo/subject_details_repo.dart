import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/subject_details_model/subject_details_model.dart';

class SubjectDetailsRepo {
  final ApiService _apiService;
  SubjectDetailsRepo(this._apiService);
  Future<ApiResult<List<GetStudentGradesDetailsForOneMaterialModel>>> getSubjectDetails(token,
      {required String studentId,required int materialId}) async {
    try {
      final response = await _apiService.getStudentGradesDetailsForOneMaterial(token,
          studentId,materialId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
