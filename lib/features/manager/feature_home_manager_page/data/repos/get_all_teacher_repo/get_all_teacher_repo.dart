import 'package:ablexa/features/manager/feature_home_manager_page/data/models/get_all_teacher_model/get_all_teacher_model.dart';
import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetAllTeacherRepo {
  final ApiService _apiService;

  GetAllTeacherRepo(this._apiService);

  Future<ApiResult<List<GetAllTeacherModel>>> getAllTeacherData() async {
    try {
      final response = await _apiService.getAllTeacherData();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<GetAllTeacherModel>>> searchTeacherByName(String name) async {
    try {
      final ApiResult<List<GetAllTeacherModel>> allTeachersResult = await getAllTeacherData();

      return allTeachersResult.when(
        success: (allTeachers) {
          final searchedTeachers = allTeachers.where((teacher) => teacher.name!.contains(name)).toList();
          return ApiResult.success(searchedTeachers);
        },
        failure: (error) {
          return ApiResult.failure(error);
        },
      );
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
