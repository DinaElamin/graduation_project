import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_violence_model/get_violence_model.dart';
class GetViolenceRepo {
  final ApiService _apiService;
  GetViolenceRepo(this._apiService);
  Future<ApiResult<List<GetViolenceModel>>> getViolenceData() async{
    try{
      final response = await _apiService.getViolenceData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}