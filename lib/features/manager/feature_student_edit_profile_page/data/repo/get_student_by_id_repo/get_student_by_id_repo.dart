import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_student_by_id_model.dart';
class GetStudentByIdRepo {
  final ApiService _apiService;
  GetStudentByIdRepo(this._apiService);
  Future<ApiResult<GetStudentByIdModel>> getStudentsByIdData({required String studentId}) async{
    try{
      final response = await _apiService.getStudentsById(studentId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}