import 'package:ablexa/features/student/feature_subject_details_page/data/repos/subject_details_repo/subject_details_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'get_subject_details_state.dart';

class SubjectDetailsCubit extends Cubit<SubjectDetailsState> {
  final SubjectDetailsRepo subjectDetailsRepo;
  SubjectDetailsCubit(this.subjectDetailsRepo) : super(const SubjectDetailsState.initial());
  void emitSubjectDetailsStates(
      token,
      {required String studentId,required int materialId})
  async {
    emit(const SubjectDetailsState.loading());
    final response = await subjectDetailsRepo.getSubjectDetails(
      token,
       studentId: studentId,
      materialId: materialId,
    );
    response.when(
      success: (getSubjectDetails) {
        emit(SubjectDetailsState.success(getSubjectDetails));
      },
      failure: (error) {
        emit(SubjectDetailsState.error(error: error.apiErrorModel.errorMessage ?? ''));
      },
    );
  }
}
