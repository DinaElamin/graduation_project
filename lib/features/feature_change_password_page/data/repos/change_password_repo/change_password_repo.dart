import '../../models/change_password_model/change_password_model.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class ChangePasswordRepo {
  final ApiService _apiService;
  ChangePasswordRepo(this._apiService);
  Future<ApiResult> changePasswordData(String email,ChangePasswordRequestModel changePasswordRequestModel) async{
    try{
      final response = await _apiService.changePassword(email, changePasswordRequestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
