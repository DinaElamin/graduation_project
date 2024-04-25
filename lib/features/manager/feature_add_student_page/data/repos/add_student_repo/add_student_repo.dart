import 'dart:io';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class AddStudentRepo {
  final ApiService _apiService;
  AddStudentRepo(this._apiService);
  Future<ApiResult> addStudentData(String token,
      {required String Name,
      required String Email,
      required String NationalNum,
      required File Image,
      required int PClassId,
      required int TermId}) async {
    try {
      final response = await _apiService.addStudent(
          token, Name, Email, NationalNum, Image, PClassId, TermId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
