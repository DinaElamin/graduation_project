import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_classes_by_teacher_Id_model/get_classes_by_teacher_Id_model.dart';
class GetClassesByTeacherId {
  final ApiService _apiService;
  GetClassesByTeacherId(this._apiService);
  Future<ApiResult<List<GetClassesByTeacherIdModel>>> getClassesByTeacherId({required String token,required String teacherId}) async{
    try{
      final response = await _apiService.getClassesByTeacherId(token,teacherId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}