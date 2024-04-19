import 'package:ablexa/features/feature_verify_code_page/data/models/verify_pin_code_model/response/verify_code_pin_response_model.dart';
import '../../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../../core/networking/api_service.dart';
import '../../models/verify_pin_code_model/request/verify_pin_code_request_model.dart';
class VerifyPinCodeRepo {
  final ApiService _apiService;
  VerifyPinCodeRepo(this._apiService);
  Future<ApiResult<VerifyPinCodeResponseModel>> verifyCodeData(String email,VerifyPinCodeRequestModel verifyPinCodeRequestModel) async{
    try{
      final response = await _apiService.verifyPinCode(email, verifyPinCodeRequestModel);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
