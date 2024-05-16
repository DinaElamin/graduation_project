import 'dart:io';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class AddExamRepo {
  final ApiService _apiService;
  AddExamRepo(this._apiService);
  Future<ApiResult> addExamData(String token,String TeacherId,
      {required String Name,
        required int Exam_Grade,
        required int MaterialId,
        required File Image,
        }) async {
    try {
      final response = await _apiService.addExam(
          token,TeacherId, Name, Exam_Grade, MaterialId,Image);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
