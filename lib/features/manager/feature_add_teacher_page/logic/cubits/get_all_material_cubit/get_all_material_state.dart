import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_all_material_state.freezed.dart';
@freezed
abstract class GetAllMaterialDataState<T> with _$GetAllMaterialDataState<T> {
  const factory GetAllMaterialDataState.initial() = _Initial;
  const factory GetAllMaterialDataState.loading() = Loading;
  const factory GetAllMaterialDataState.success(T data) = Success<T>;
  const factory GetAllMaterialDataState.error({required String error}) = Error;

}
