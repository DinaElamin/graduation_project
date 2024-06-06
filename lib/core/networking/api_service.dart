import 'dart:io';
import 'package:ablexa/features/manager/feature_home_manager_page/data/models/delete_user_model/delete_uder_model_response.dart';
import 'package:ablexa/features/student/feature_students_exams_page/data/models/get_student_material_grade_model/get_student_material_grade_model.dart';
import '../../features/feature_change_password_page/data/models/change_password_model/change_password_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_code_model/request/verify_code_request_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_code_model/response/verify_code_response_model.dart';
import '../../features/manager/feature_add_student_page/data/models/get_all_semester_model/get_all_year_model.dart';
import '../../features/manager/feature_add_teacher_page/data/models/get_all_materail_model/get_all-matrial_model.dart';
import '../../features/manager/feature_edit_profile_teacher_page/data/models/get_teacher_by_id_model/get_teacher_by_id_model.dart';
import '../../features/manager/feature_garde_details_page/data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';
import '../../features/manager/feature_garde_details_page/data/models/get_semester_by_term_id_model/get_semester_by_year_id_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_student_model/get_all_student_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_teacher_model/get_all_teacher_model.dart';
import 'package:dio/dio.dart' hide Headers;
import '../../features/feature_login_page/data/models/login/request/login_request_model.dart';
import '../../features/feature_login_page/data/models/login/response/login_response_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_pin_code_model/request/verify_pin_code_request_model.dart';
import '../../features/feature_verify_code_page/data/models/verify_pin_code_model/response/verify_code_pin_response_model.dart';
import '../../features/manager/feature_get_all_student_by_id_page/data/model/get_all_student_by_id_model/get_all_student_by_id_model.dart';
import '../../features/manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';
import '../../features/manager/feature_student_edit_profile_page/data/models/get_student_by_id_model.dart';
import '../../features/student/feature_students_exams_page/data/models/get_material_by_teacher_id_model/get_material_by_teacher_id_model.dart';
import '../../features/student/feature_subject_details_page/data/models/subject_details_model/subject_details_model.dart';
import '../../features/teacher/feature_teacher_home_page/data/models/get_classes_by_teacher_Id_model/get_classes_by_teacher_Id_model.dart';
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
  // delete grade
  @DELETE("${ApiConstant.deleteGrade}/{yearId}")
  Future deleteGrade(
      @Header("Authorization") String token,
      @Path("yearId") int yearId,
      );
// edit profile student
  @PUT("${ApiConstant.editStudentProfile}/{userId}")
  @MultiPart()
  Future editStudentProfile(
      @Header("Authorization") String token,
      @Path("userId") String userId,
      @Part(name: "Name") String Name,
      @Part(name: "Email") String Email,
      @Part(name: "NationalNum") String NationalNum,
      @Part(name: "Image") File Image,
      @Part(name: "PClassId") int PClassId,
      @Part(name: "YearId") int YearId
      );
  // edit teacher student
  @PUT("${ApiConstant.editTeacherProfile}/{userId}")
  @MultiPart()
  Future editTeacherProfile(
      @Header("Authorization") String token,
      @Path("userId") String userId,
      @Part(name: "Name") String Name,
      @Part(name: "Email") String Email,
      @Part(name: "NationalNum") String NationalNum,
      @Part(name: "Image") File Image,
      @Part(name: "SubjectName") String SubjectName,
      @Part(name: "AssignClassId") List<String> AssignClassId,
      );
  // edit teacher student
  @PUT("${ApiConstant.editGradeExam}/{studentGradeId}/{ExamId}/{StudentId}/{TeacherId}")
  @MultiPart()
  Future editGradeExam(
      @Header("Authorization") String token,
      @Path("studentGradeId") int studentGradeId,
      @Path("StudentId") String StudentId,
      @Path("ExamId") int ExamId,
      @Path("TeacherId") String TeacherId,
      @Part(name: "Student_Grade") int Student_Grade,
      );
  // add year
  @POST(ApiConstant.addYear)
  @MultiPart()
  Future addYear(
      @Header("Authorization") String token,
      @Part(name: "YearName") String YearName,
      @Part(name: "Index") int Index,
      @Part(name: "FirstSemesterMaterial") List<String> FirstSemesterMaterial,
      @Part(name: "SecondSemesterMaterial") List<String> SecondSemesterMaterial,
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


  // add material grade
  @POST("${ApiConstant.addMaterialGrade}/{materialid}")
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future addMaterialGrade(
      @Header("Authorization") String token,
      @Path("materialid") int materialid,
      @Part(name: "M_grade") int M_grade,
      );
  // add class
  @POST(ApiConstant.addClass)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future addClass(
      @Header("Authorization") String token,
      @Field() String name,
      );
  // add Teacher
  @POST(ApiConstant.addTeacher)
  @MultiPart()
  Future addTeacher(
      @Header("Authorization") String token,
      @Part(name: "Name") String Name,
      @Part(name: "Email") String Email,
      @Part(name: "NationalNum") String NationalNum,
      @Part(name: "SubjectName") String SubjectName,
      @Part(name: "AssignClassId") List<String> assignClassId, // Use the parameter directly
      @Part(name: "Image") File Image,
      );
  // add exam
  @POST(ApiConstant.addExam)
  @MultiPart()
  Future addExam(
      @Header("Authorization") String token,
      @Query("TeacherId") String TeacherId,
      @Part(name: "Name") String Name,
      @Part(name: "Exam_Grade") int Exam_Grade,
      @Part(name: "MaterialId") int MaterialId,
      @Part(name: "Image") File Image,
      );
  // add exam
  @POST("${ApiConstant.addGrade}/{StudentId}/{ExamId}/{TeacherId}")
  @MultiPart()
  Future addGrade(
      @Header("Authorization") String token,
      @Path() int ExamId,
      @Path() String StudentId,
      @Path() String TeacherId,
      @Part(name: "Student_Grade") int Student_Grade,
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
  // get all year
  @GET(ApiConstant.getAllMaterials)
  Future<List<GetAllMaterialModel>> getAllMaterialData();
  // get all year
  @GET("${ApiConstant.getAllMaterialByTermId}/{termId}")
  Future<List<GetAllMaterialByTermIdModel>> getAllMaterialByTermIdData(
      @Path("termId") int termId,
      );

  // get All teacher
  @GET(ApiConstant.getAllTeacherData)
  Future<List<GetAllTeacherModel>> getAllTeacherData();
// get semester by year id
  @GET("${ApiConstant.getSemesterByYearId}/{yearId}")
  Future<List<GetSemesterByYearIdModel>> getSemesterByYearId(
      @Path("yearId") int yearId
      );
  // get material by teacher id
  @GET("${ApiConstant.getMaterialByTeacherId}/{TeacherId}")
  Future<List<GetMaterialByTeacherIdModel>> getMaterialByTeacherId(
      @Path("TeacherId") String TeacherId
      );
  // get classes by teacher id
  @GET("${ApiConstant.getClassesByTeacherId}/{TeacherId}")
  Future<List<GetClassesByTeacherIdModel>> getClassesByTeacherId(
      @Header("Authorization") String token,
      @Path("TeacherId") String TeacherId
      );
  // get student material garde
  @GET("${ApiConstant.getStudentMaterialGrade}/{studentId}/{termId}")
  Future<List<GetStudentMaterialGradeModel>> getStudentMaterialGrade(
      @Header("Authorization") String token,
      @Path("studentId") String studentId,
      @Path("termId") int termId,

      );
  // getStudentGradesDetailsForOneMaterial
  @GET("${ApiConstant.getStudentGradesDetailsForOneMaterial}/{studentId}/{materialId}")
  Future<List<GetStudentGradesDetailsForOneMaterialModel>> getStudentGradesDetailsForOneMaterial(
      @Header("Authorization") String token,
      @Path("studentId") String studentId,
      @Path("materialId") int materialId,

      );
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
  // get student by id
  @GET("${ApiConstant.getStudentById}/{studentId}")
  Future<GetStudentByIdModel> getStudentsById(
      @Path("studentId") String studentId);
  // get teacher by id
  @GET("${ApiConstant.getAllTeacherById}/{TeacherId}")
  Future<GetTeacherByIdModel> getTeacherById(
      @Path("TeacherId") String TeacherId);
}
