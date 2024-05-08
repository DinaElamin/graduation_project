
import 'dart:io';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
class AddTeacherRepo {
  final ApiService _apiService;
  AddTeacherRepo(this._apiService);
  Future<ApiResult> addTeacherData(String token,
      {required String Name,required String Email,required String NationalNum,required File Image,required String SubjectName,required List<String> AssignClassId }) async{
    try{
      final response = await _apiService.addTeacher(token,Name,Email,NationalNum,SubjectName,AssignClassId,Image);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
