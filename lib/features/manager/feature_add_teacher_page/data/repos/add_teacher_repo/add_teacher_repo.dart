
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';
import '../../models/add_teacher_model/add_teacher_model.dart';
class AddTeacherRepo {
  final ApiService _apiService;
  AddTeacherRepo(this._apiService);
  Future<ApiResult> addTeacherData(String token,
      {required String Name,required String Email,required String NationalNum,required File Image}) async{
    try{
      final response = await _apiService.addTeacher(token,Name,Email,NationalNum,Image);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
