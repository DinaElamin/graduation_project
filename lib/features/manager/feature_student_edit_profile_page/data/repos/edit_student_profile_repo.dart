import 'dart:io';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class EditStudentRepo {
  final ApiService _apiService;
  EditStudentRepo(this._apiService);
  Future<ApiResult> editStudentData(
      String token,String userId,
      {
        required String Name,
      required String Email,
      required String NationalNum,
      required File Image,
      required int YearId,
      required int PClassId}) async {
    try {
      final response = await _apiService.editStudentProfile(
          userId, token, Name, Email, NationalNum, Image, YearId, PClassId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
