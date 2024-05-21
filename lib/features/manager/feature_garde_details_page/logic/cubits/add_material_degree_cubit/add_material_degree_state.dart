import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_material_degree_state.freezed.dart';
@freezed
abstract class AddMaterialDegreeState<T> with _$AddMaterialDegreeState<T> {
  const factory AddMaterialDegreeState.initial() = _Initial;
  const factory AddMaterialDegreeState.loading() = Loading;
  const factory AddMaterialDegreeState.success(T data) = Success<T>;
  const factory AddMaterialDegreeState.error({required String error}) = Error;

}
