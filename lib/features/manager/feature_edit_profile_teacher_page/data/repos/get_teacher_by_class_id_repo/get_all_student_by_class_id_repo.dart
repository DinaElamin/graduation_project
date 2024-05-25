import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_teacher_by_id_model/get_teacher_by_id_model.dart';
class GetTeacherByIdRepo {
  final ApiService _apiService;
  GetTeacherByIdRepo(this._apiService);
  Future<ApiResult<GetTeacherByIdModel>> getAllTeacherIdData({required String teacherId}) async{
    try{
      final response = await _apiService.getTeacherById(teacherId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
