
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
class EditGradeRepo {
  final ApiService _apiService;
  EditGradeRepo(this._apiService);
  Future<ApiResult> editGradeRepo(String token,
      {required int studentGradeId ,required int ExamId,required String StudentId,required String TeacherId,required int Student_Grade }) async{
    try{

      final response = await _apiService.editGradeExam(
          token,
        studentGradeId,
          StudentId,
        ExamId,
          TeacherId,
          Student_Grade,
          );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
