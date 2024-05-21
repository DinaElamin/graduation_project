import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class AddMaterialDegreeRepo {
  final ApiService _apiService;
  AddMaterialDegreeRepo(this._apiService);
  Future<ApiResult> addMaterialDegreeRepo(String token,
      {required int materialid,required int M_grade}) async {
    try {
      final response = await _apiService.addMaterialGrade(
          token, materialid,M_grade);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
