import 'package:ablexa/features/manager/feature_add_grade_page/data/repos/add_year_repo/add_year_repo.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_student_page/data/repos/add_student_repo/add_student_repo.dart';
import 'package:ablexa/features/manager/feature_add_student_page/data/repos/get_all_year_repo/get_all_year_repo.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/data/repos/get_all_matrial_repo/get_all_matrial_repo.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/data/repos/edit_teacher_profile_repo.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/data/repos/get_teacher_by_class_id_repo/get_all_student_by_class_id_repo.dart';
import 'package:ablexa/features/manager/feature_edit_profile_teacher_page/logic/cubits/edit_teacher_cubit/edit_teacher_cubit.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/add_material_grade_repo/add_material_degree_repo.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/get_all_material_by_term_id_repo/get_all_material_by_term_id_repo.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/data/repos/get_semester_by_year_id_repo/get_semester_by_year_id_repo.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/add_material_degree_cubit/add_material_degree_cubit.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_cubit.dart';
import 'package:ablexa/features/manager/feature_grades_page/data/repos/delete_grade_repo/delete_grade_repo.dart';
import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/delete_user_repo/delete_user_repo.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/delete_user_cubit/delete_user_cubit.dart';
import 'package:ablexa/features/manager/feature_student_edit_profile_page/logic/cubits/edit_student_cubit/edit_student_cubit.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/data/repos/add_exam_repo/add_exam_repo.dart';
import 'package:ablexa/features/teacher/feature_add_exam_page/logic/cubits/add_exam_cubit/add_exam_cubit.dart';
import '../../features/feature_change_password_page/data/repos/change_password_repo/change_password_repo.dart';
import '../../features/feature_change_password_page/logic/cubits/change_password_cubit/change_password_cubit.dart';
import '../../features/feature_login_page/data/repos/login_repo/login_repo.dart';
import '../../features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import '../../features/feature_verify_code_page/data/repos/verify_code_repo/verify_code_repo.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_code_cubit/verify_code_cubit.dart';
import '../../features/manager/feature_add_student_page/logic/cubits/add_student_cubit/add_student_cubit.dart';
import '../../features/manager/feature_add_teacher_page/data/repos/add_teacher_repo/add_teacher_repo.dart';
import '../../features/manager/feature_add_teacher_page/logic/cubits/add_teacher_cubit/add_teacher_cubit.dart';
import '../../features/manager/feature_edit_profile_teacher_page/logic/cubits/get_all_teacher_by_id_cubit/get_all_Teacher_by_id_cubit.dart';
import '../../features/manager/feature_garde_details_page/data/repos/add_class_repo/add_class_repo.dart';
import '../../features/manager/feature_garde_details_page/logic/cubits/add_class_cubit/add_class_cubit.dart';
import '../../features/manager/feature_garde_details_page/logic/cubits/get_semester_by_year_id_cubit/get_semester_by_year_id_cubit.dart';
import '../../features/manager/feature_get_all_student_by_id_page/data/repos/get_all_student_by_class_id_repo/get_all_student_by_class_id_repo.dart';
import '../../features/manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import '../../features/manager/feature_home_manager_page/data/repos/get_all_classes_repo/get_all_classes_repo.dart';
import '../../features/manager/feature_home_manager_page/data/repos/get_all_teacher_repo/get_all_teacher_repo.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/feature_verify_code_page/data/repos/verify_pin_code_repo/verify_code_repo.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_pin_code_cubit/verify_pin_code_cubit.dart';
import '../../features/manager/feature_home_manager_page/data/repos/get_all_student_repo/get_all_student_repo.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/get_all_student_cubit/get_all_student_cubit.dart';
import '../../features/manager/feature_student_edit_profile_page/data/repo/edit_student_profile_repo/edit_student_profile_repo.dart';
import '../../features/manager/feature_student_edit_profile_page/data/repo/get_student_by_id_repo/get_student_by_id_repo.dart';
import '../../features/manager/feature_student_edit_profile_page/logic/cubits/get_students_by_id_cubit/get_students_by_id_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login page
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // get all teacher data
  getIt.registerLazySingleton<GetAllTeacherRepo>(() => GetAllTeacherRepo(getIt()));
  getIt.registerFactory<GetAllTeacherDataCubit>(() => GetAllTeacherDataCubit(getIt()));
  // get all student data
  getIt.registerLazySingleton<GetAllStudentRepo>(() => GetAllStudentRepo(getIt()));
  getIt.registerFactory<GetAllStudentDataCubit>(() => GetAllStudentDataCubit(getIt()));
  // get all classes data
  getIt.registerLazySingleton<GetAllClassesRepo>(() => GetAllClassesRepo(getIt()));
  getIt.registerFactory<GetAllClassesDataCubit>(() => GetAllClassesDataCubit(getIt()));
  // get all students by classId data
  getIt.registerLazySingleton<GetAllStudentsByClassIdRepo>(() => GetAllStudentsByClassIdRepo(getIt()));
  getIt.registerFactory<GetAllStudentByClassIdCubit>(() => GetAllStudentByClassIdCubit(getIt()));
  // verify code data
  getIt.registerLazySingleton<VerifyCodeRepo>(() => VerifyCodeRepo(getIt()));
  getIt.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(getIt()));
  // verify pin code data
  getIt.registerLazySingleton<VerifyPinCodeRepo>(() => VerifyPinCodeRepo(getIt()));
  getIt.registerFactory<VerifyPinCodeCubit>(() => VerifyPinCodeCubit(getIt()));
  // change password data
  getIt.registerLazySingleton<ChangePasswordRepo>(() => ChangePasswordRepo(getIt()));
  getIt.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit(getIt()));
  // add teacher data
  getIt.registerLazySingleton<AddTeacherRepo>(() => AddTeacherRepo(getIt()));
  getIt.registerFactory<AddTeacherCubit>(() => AddTeacherCubit(getIt()));
  // add student data
  getIt.registerLazySingleton<AddStudentRepo>(() => AddStudentRepo(getIt()));
  getIt.registerFactory<AddStudentCubit>(() => AddStudentCubit(getIt()));
  // delete user
  getIt.registerLazySingleton<DeleteUserRepo>(() => DeleteUserRepo(getIt()));
  getIt.registerFactory<DeleteUserCubit>(() => DeleteUserCubit(getIt()));
  // delete grade
  getIt.registerLazySingleton<DeleteGradeRepo>(() => DeleteGradeRepo(getIt()));
  getIt.registerFactory<DeleteGradeCubit>(() => DeleteGradeCubit(getIt()));
  // get all semester
  getIt.registerLazySingleton<GetAllYearRepo>(() => GetAllYearRepo(getIt()));
  getIt.registerFactory<GetAllYearDataCubit>(() => GetAllYearDataCubit(getIt()));
  // get all material
  getIt.registerLazySingleton<GetAllMaterialRepo>(() => GetAllMaterialRepo(getIt()));
  getIt.registerFactory<GetAllMaterialDataCubit>(() => GetAllMaterialDataCubit(getIt()));
  // edit student
  getIt.registerLazySingleton<EditStudentRepo>(() => EditStudentRepo(getIt()));
  getIt.registerFactory<EditStudentCubit>(() => EditStudentCubit(getIt()));
  // get student by id
  getIt.registerLazySingleton<GetStudentByIdRepo>(() => GetStudentByIdRepo(getIt()));
  getIt.registerFactory<GetStudentByIdCubit>(() => GetStudentByIdCubit(getIt()));
  // add year cubit
  getIt.registerLazySingleton<AddYearRepo>(() => AddYearRepo(getIt()));
  getIt.registerFactory<AddYearCubit>(() => AddYearCubit(getIt()));
  // add exam cubit
  getIt.registerLazySingleton<AddExamRepo>(() => AddExamRepo(getIt()));
  getIt.registerFactory<AddExamCubit>(() => AddExamCubit(getIt()));
  // edit teacher cubit
  getIt.registerLazySingleton<EditTeacherRepo>(() => EditTeacherRepo(getIt()));
  getIt.registerFactory<EditTeacherCubit>(() => EditTeacherCubit(getIt()));
  // add class cubit
  getIt.registerLazySingleton<AddClassRepo>(() => AddClassRepo(getIt()));
  getIt.registerFactory<AddClassCubit>(() => AddClassCubit(getIt()));
  //add material degree
  getIt.registerLazySingleton<AddMaterialDegreeRepo>(() => AddMaterialDegreeRepo(getIt()));
  getIt.registerFactory<AddMaterialGradeCubit>(() => AddMaterialGradeCubit(getIt()));
  //add material degree
  getIt.registerLazySingleton<GetSemesterByIdRepo>(() => GetSemesterByIdRepo(getIt()));
  getIt.registerFactory<GetSemesterByIdCubit>(() => GetSemesterByIdCubit(getIt()));
  //get all material by termId
  getIt.registerLazySingleton<GetAllMaterialByTermIdRepo>(() => GetAllMaterialByTermIdRepo(getIt()));
  getIt.registerFactory<GetAllMaterialByTermIdCubit>(() => GetAllMaterialByTermIdCubit(getIt()));
  //get teacher by id
  getIt.registerLazySingleton<GetTeacherByIdRepo>(() => GetTeacherByIdRepo(getIt()));
  getIt.registerFactory<GetTeacherByIdCubit>(() => GetTeacherByIdCubit(getIt()));
 }