import 'dart:io';
import '../../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../../core/networking/api_result.dart';
import '../../../../../../../core/networking/api_service.dart';

class EditTeacherRepo {
  final ApiService _apiService;
  EditTeacherRepo(this._apiService);
  Future<ApiResult> editTeacherData(
      String token,String userId,
      {
        required String Name,
        required String Email,
        required String NationalNum,
        required File Image,
        required List<String> AssignClassId}) async {
    try {
      final response = await _apiService.editTeacherProfile(
          userId, token, Name, Email, NationalNum, Image, AssignClassId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}