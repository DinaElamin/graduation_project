import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetAllMaterialRepo {
  final ApiService _apiService;
  GetAllMaterialRepo(this._apiService);
  Future<ApiResult> getAllMaterialData() async {
    try {
      final response = await _apiService.getAllMaterialData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
