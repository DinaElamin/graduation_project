import 'package:ablexa/features/feature_login_page/data/models/login/request/login_response_model.dart';
import 'package:ablexa/features/feature_login_page/data/models/login/response/login_request_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);
  Future<ApiResult<LoginResponseModel>> login(LoginRequestModel requestModel) async{
    try{
      final response = await _apiService.login(requestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
