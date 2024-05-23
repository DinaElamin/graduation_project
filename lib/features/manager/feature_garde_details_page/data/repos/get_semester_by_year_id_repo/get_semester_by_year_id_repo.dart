import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_semester_by_term_id_model/get_semester_by_year_id_model.dart';

class GetSemesterByIdRepo {
  final ApiService _apiService;

  GetSemesterByIdRepo(this._apiService);
  Future<ApiResult<List<GetSemesterByYearIdModel>>> getSemesterByYearId(
      {required int yearId}) async {
    try {
      final response = await _apiService.getSemesterByYearId(yearId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
