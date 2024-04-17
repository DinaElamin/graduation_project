import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/get_all_student_model/get_all_student_model.dart';
class GetAllStudentRepo {
  final ApiService _apiService;
  GetAllStudentRepo(this._apiService);
  Future<ApiResult<List<GetAllStudentModel>>> getAllStudentData() async{
    try{
      final response = await _apiService.getAllStudentData();
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
