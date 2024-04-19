import 'package:ablexa/features/feature_login_page/data/repos/login_repo/login_repo.dart';
import 'package:ablexa/features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import 'package:ablexa/features/feature_verify_code_page/data/repos/verify_code_repo/verify_code_repo.dart';
import 'package:ablexa/features/feature_verify_code_page/logic/cubits/verify_code_cubit/verify_code_cubit.dart';
import 'package:ablexa/features/manager/feature_get_all_student_by_id_page/data/repos/get_all_student_by_class_id_repo/get_all_student_by_class_id_repo.dart';
import 'package:ablexa/features/manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/get_all_classes_repo/get_all_classes_repo.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/get_all_teacher_repo/get_all_teacher_repo.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/feature_verify_code_page/data/repos/verify_pin_code_repo/verify_code_repo.dart';
import '../../features/feature_verify_code_page/logic/cubits/verify_pin_code_cubit/verify_pin_code_cubit.dart';
import '../../features/manager/feature_home_manager_page/data/repos/get_all_student_repo/get_all_student_repo.dart';
import '../../features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/get_all_student_cubit/get_all_student_cubit.dart';
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
  // verify code cubit
  getIt.registerLazySingleton<VerifyCodeRepo>(() => VerifyCodeRepo(getIt()));
  getIt.registerFactory<VerifyCodeCubit>(() => VerifyCodeCubit(getIt()));
  // verify pin code cubit
  getIt.registerLazySingleton<VerifyPinCodeRepo>(() => VerifyPinCodeRepo(getIt()));
  getIt.registerFactory<VerifyPinCodeCubit>(() => VerifyPinCodeCubit(getIt()));
 }