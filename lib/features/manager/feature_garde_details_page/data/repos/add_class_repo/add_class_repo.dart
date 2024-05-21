import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class AddClassRepo {
  final ApiService _apiService;
  AddClassRepo(this._apiService);
  Future<ApiResult> addClassRepo(String token,
      {required String name}) async {
    try {
      final response = await _apiService.addClass(
          token, name);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
