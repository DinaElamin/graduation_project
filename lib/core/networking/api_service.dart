import 'package:ablexa/features/feature_login_page/data/models/login/request/login_response_model.dart';
import 'package:ablexa/features/feature_login_page/data/models/login/response/login_request_model.dart';
import 'package:ablexa/features/feature_verify_code_page/data/models/verify_code_model/request/verify_code_request_model.dart';
import 'package:ablexa/features/feature_verify_code_page/data/models/verify_code_model/response/verify_code_response_model.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/models/get_all_student_model/get_all_student_model.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/models/get_all_teacher_model/get_all_teacher_model.dart';
import 'package:dio/dio.dart' hide Headers;
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
//   // signIn
//   @POST(ApiConstant.login)
//   @FormUrlEncoded()
//   Future<SignInResponseBody> login(
//       @Body() SignInRequestBody loginRequestBody,
//       );
//
//   //signUp
//   @POST(ApiConstant.signUp)
//   @FormUrlEncoded()
//   Future<SignUpResponseBody> signUp(
//       @Body() SignUpRequestBody signUpRequestBody,
//       );
//
//   //logout
//
//   @GET(ApiConstant.logout)
//   @Headers({"Authorization": "Bearer {token}"})
//   Future<LogoutDataModel> logout();
//
  // getAllTeacher Page
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
  Future<List<GetAllStudentsByClassIdModel>> getAllStudentsByClassId(@Path("classId") int classId);
//
//   // specializationPopularDoctorsData
//   @GET(ApiConstant.specializationPopularDoctors)
//   @FormUrlEncoded()
//   Future<SpecializationPopularDoctorsModel> specializationPopularDoctorsData();
//
//   //MyFavoriteDoctorScreen
//
//   @GET(ApiConstant.doctor)
//   @FormUrlEncoded()
//   Future<DoctorModel> doctorData(@Query("category_id") int categoryId);
//
// // booking
//   @GET(ApiConstant.bookingPatient)
//   @FormUrlEncoded()
//   Future<BookingModel> bookingData(
//       @Query("status") String status,
//       @Header("Authorization") String token,
//       );
//   // booking accept
//   @POST(ApiConstant.bookingAccept)
//   @FormUrlEncoded()
//   Future<BookingAcceptModel> bookingAccept(
//       @Body() BookingAcceptRequestBody bookingAcceptRequestBody,
//      @Header("Authorization") String token,
//       );
//   // booking accept details
//   @POST(ApiConstant.bookingAcceptDetails)
//   @FormUrlEncoded()
//   Future<BookingAcceptDetailsResponseBody> bookingAcceptDetails(
//       @Body() BookingAcceptDetailsRequestBody bookingAcceptDetailsRequestBody,
//       @Header("Authorization") String token,
//       );

}


