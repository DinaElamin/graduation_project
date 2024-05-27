import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetMaterialByTeacherIdRepo {
  final ApiService _apiService;
  GetMaterialByTeacherIdRepo(this._apiService);
  Future<ApiResult> getMaterialByTeacherId(
      {required String TeacherId}) async {
    try {
      final response = await _apiService.getMaterialByTeacherId(TeacherId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
