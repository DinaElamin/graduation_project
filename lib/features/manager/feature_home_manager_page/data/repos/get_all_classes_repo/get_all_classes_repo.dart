import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_all_classes_model/get_all_classes_model.dart';
class GetAllClassesRepo {
  final ApiService _apiService;
  GetAllClassesRepo(this._apiService);
  Future<ApiResult<List<GetAllClassesModel>>> getAllClassesData() async{
    try{
      final response = await _apiService.getAllClassesData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
