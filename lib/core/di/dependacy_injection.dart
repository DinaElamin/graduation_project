import 'package:ablexa/features/feature_login_page/data/repos/login_repo/login_repo.dart';
import 'package:ablexa/features/feature_login_page/logic/cubits/login_cubit/login_cubit/login_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/get_all_student_model/get_all_student_model.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/data/repos/get_all_teacher_repo/get_all_teacher_repo.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_student_cubit/login_cubit/get_all_student_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
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
 }