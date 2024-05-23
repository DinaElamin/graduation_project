import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_material_by_term_id_state.freezed.dart';
@freezed
abstract class GetAllMaterialByTermIdState<T> with _$GetAllMaterialByTermIdState<T> {
  const factory GetAllMaterialByTermIdState.initial() = _Initial;
  const factory GetAllMaterialByTermIdState.loading() = Loading;
  const factory GetAllMaterialByTermIdState.success(T data) = Success<T>;
  const factory GetAllMaterialByTermIdState.error({required String error}) = Error;

}
