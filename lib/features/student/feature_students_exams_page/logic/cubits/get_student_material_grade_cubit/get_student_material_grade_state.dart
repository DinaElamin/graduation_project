import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_student_material_grade_state.freezed.dart';
@freezed
abstract class GetStudentMaterialGradeState<T> with _$GetStudentMaterialGradeState<T> {
  const factory GetStudentMaterialGradeState.initial() = _Initial;
  const factory GetStudentMaterialGradeState.loading() = Loading;
  const factory GetStudentMaterialGradeState.success(T data) = Success<T>;
  const factory GetStudentMaterialGradeState.error({required String error}) = Error;

}
