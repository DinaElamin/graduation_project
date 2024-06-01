
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
class AddGradeRepo {
  final ApiService _apiService;
  AddGradeRepo(this._apiService);
  Future<ApiResult> addGradeRepo(String token,
      {required int ExamId,required String StudentId,required String TeacherId,required int Student_Grade }) async{
    try{
      final response = await _apiService.addGrade(
          token,
          ExamId,
          StudentId,
          TeacherId,
          Student_Grade,
          );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
