import 'package:ablexa/features/feature_verify_code_page/data/models/verify_code_model/request/verify_code_request_model.dart';
import '../../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../../core/networking/api_service.dart';
import '../../models/verify_code_model/response/verify_code_response_model.dart';
class VerifyCodeRepo {
  final ApiService _apiService;
  VerifyCodeRepo(this._apiService);
  Future<ApiResult<VerifyCodeResponseModel>> verifyCodeData(VerifyCodeRequestModel verifyCodeRequestModel) async{
    try{
      final response = await _apiService.verifyCode(verifyCodeRequestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
