import 'dart:io';

import 'package:ablexa/features/manager/feature_home_manager_page/data/models/delete_user_model/delete_uder_model_response.dart';

import '../../features/feature_change_password_page/data/models/change_password_model/change_password_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_code_model/request/verify_code_request_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_code_model/response/verify_code_response_model.dart';
import '../../features/manager/feature_add_student_page/data/models/get_all_semester_model/get_all_year_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_student_model/get_all_student_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_teacher_model/get_all_teacher_model.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../features/feature_login_page/data/models/login/request/login_request_model.dart';
import '../../features/feature_login_page/data/models/login/response/login_response_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_pin_code_model/request/verify_pin_code_request_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_pin_code_model/response/verify_code_pin_response_model.dart';
import '../../features/manager/feature_get_all_student_by_id_page/data/model/get_all_student_by_id_model/get_all_student_by_id_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // login page
  @POST(ApiConstant.login)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<LoginResponseModel> login(
    @Body() LoginRequestModel loginRequestModel,
  );
  // verify Code page
  @POST(ApiConstant.verifyCode)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<VerifyCodeResponseModel> verifyCode(
    @Body() VerifyCodeRequestModel verifyCodeRequestModel,
  );
  // verify pin Code page
  @POST("${ApiConstant.verifyPinCode}/{email}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<VerifyPinCodeResponseModel> verifyPinCode(
      @Path("email") String email,
      @Body() VerifyPinCodeRequestModel verifyPinCodeRequestModel,
      );
  // delete user
  @DELETE("${ApiConstant.deleteUser}/{userId}")
  Future<DeleteUserModel> deleteUser(
      @Header("Authorization") String token,
      @Path("userId") String userId,
      );


  // change password page
  @POST("${ApiConstant.changePassword}/{email}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future changePassword(
    @Path("email") String email,
    @Body() ChangePasswordRequestModel changePasswordRequestModel,
  );
  // add Teacher
  @POST(ApiConstant.addTeacher)
  @MultiPart()
  Future addTeacher(
      @Header("Authorization") String token,
      @Part(name: "Name") String name,
      @Part(name: "Email") String email,
      @Part(name: "NationalNum") String nationalNum,
      @Part(name: "Image") File image,
      );
  // add Student
  @POST(ApiConstant.addStudent)
  @MultiPart()
  Future addStudent(
      @Header("Authorization") String token,
      @Part(name: "Name") String name,
      @Part(name: "Email") String email,
      @Part(name: "NationalNum") String nationalNum,
      @Part(name: "Image") File image,
      @Part(name: "PClassId") int PClassId,
      @Part(name: "YearId") int YearId,
      );
  // get all year
  @GET(ApiConstant.getAllYear)
  Future<List<GetAllYearModel>> getAllYearData();
  // // get all semester
  // @GET(ApiConstant.getAllSemester)
  // Future<List<GetAllSemesterModel>> getAllSemesterData();
  // get All teacher
  @GET(ApiConstant.getAllTeacherData)
  Future<List<GetAllTeacherModel>> getAllTeacherData();
  // getAllStudent Page
  @GET(ApiConstant.getAllStudentData)
  Future<List<GetAllStudentModel>> getAllStudentData();
  // getAllClass Page
  @GET(ApiConstant.getAllClassesData)
  Future<List<GetAllClassesModel>> getAllClassesData();
  // getAllStudentsByClassId Page
  @GET("${ApiConstant.getAllStudentByClassId}/{classId}")
  Future<List<GetAllStudentsByClassIdModel>> getAllStudentsByClassId(
      @Path("classId") int classId);
}
