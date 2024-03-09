import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';
final getIt = GetIt.instance;
 Future<void> setupGetIt () async{
//Dio & apiServices
  Dio dio =  await DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

 //  // booking accept Details
 //  getIt.registerLazySingleton<BookingAcceptDetailsRepo>(() => BookingAcceptDetailsRepo(getIt()));
 //  getIt.registerFactory<BookingAcceptDetailsCubit>(() => BookingAcceptDetailsCubit(getIt()));
 }