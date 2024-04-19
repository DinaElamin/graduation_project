import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../model/get_all_student_by_id_model/get_all_student_by_id_model.dart';
class GetAllStudentsByClassIdRepo {
  final ApiService _apiService;
  GetAllStudentsByClassIdRepo(this._apiService);
  Future<ApiResult<List<GetAllStudentsByClassIdModel>>> getAllStudentsByClassIdData({required int classId}) async{
    try{
      final response = await _apiService.getAllStudentsByClassId(classId);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
