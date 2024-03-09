import 'package:dio/dio.dart' hide Headers;
import 'api_constant.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

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
//   // homeSlider data
//   @GET(ApiConstant.homeSlider)
//   @FormUrlEncoded()
//   Future<SliderModel> homeSliderData();
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


