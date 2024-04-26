import 'package:ablexa/features/manager/feature_home_manager_page/data/models/delete_user_model/delete_uder_model_response.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class DeleteUserRepo {
  final ApiService _apiService;

  DeleteUserRepo(this._apiService);

  Future<ApiResult<DeleteUserModel>> deleteUserData({required String token,required String userId}) async {
    try {
      final response = await _apiService.deleteUser(token,userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
