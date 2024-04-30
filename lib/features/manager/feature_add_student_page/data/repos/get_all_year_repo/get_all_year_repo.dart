import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetAllSemesterRepo {
  final ApiService _apiService;
  GetAllSemesterRepo(this._apiService);
  Future<ApiResult> getAllSemesterData() async {
    try {
      final response = await _apiService.getAllSemesterData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
