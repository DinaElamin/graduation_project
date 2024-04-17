import 'package:ablexa/features/manager/feature_home_manager_page/data/models/get_all_teacher_model/get_all_teacher_model.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
class GetAllTeacherRepo {
  final ApiService _apiService;
  GetAllTeacherRepo(this._apiService);
  Future<ApiResult<GetAllTeacherModel>> getAllTeacherData() async{
    try{
      final response = await _apiService.getAllTeacherData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
