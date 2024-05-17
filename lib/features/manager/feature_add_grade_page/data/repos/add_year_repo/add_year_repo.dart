import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class AddYearRepo {
  final ApiService _apiService;
  AddYearRepo(this._apiService);
  Future<ApiResult> addYear(
    String token, {
        required String YearName,

        required int Index,
    required List<String> FirstSemesterMaterial,
    required List<String> SecondSemesterMaterial,
  }) async {
    try {
      final response = await _apiService.addYear(
          token, YearName,  Index,FirstSemesterMaterial, SecondSemesterMaterial);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
