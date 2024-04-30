import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetAllYearRepo {
  final ApiService _apiService;
  GetAllYearRepo(this._apiService);
  Future<ApiResult> getAllYearData() async {
    try {
      final response = await _apiService.getAllSemesterData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
