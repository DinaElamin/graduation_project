import 'package:ablexa/features/manager/feature_home_manager_page/data/models/delete_user_model/delete_uder_model_response.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class DeleteGradeRepo {
  final ApiService _apiService;

  DeleteGradeRepo(this._apiService);

  Future<ApiResult<DeleteUserModel>> deleteGradeData(
      {required String token,required int yearId}) async {
    try {
      final response = await _apiService.deleteGrade(token,yearId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
