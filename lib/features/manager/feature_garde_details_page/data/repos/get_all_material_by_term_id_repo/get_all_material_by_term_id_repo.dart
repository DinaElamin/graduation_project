import 'package:ablexa/features/manager/feature_garde_details_page/data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../../core/networking/api_result.dart';
import '../../../../../../core/networking/api_service.dart';

class GetAllMaterialByTermIdRepo {
  final ApiService _apiService;

  GetAllMaterialByTermIdRepo(this._apiService);
  Future<ApiResult<List<GetAllMaterialByTermIdModel>>> getAllMaterialByTermId(
      {required int termId}) async {
    try {
      final response = await _apiService.getAllMaterialByTermIdData(termId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
