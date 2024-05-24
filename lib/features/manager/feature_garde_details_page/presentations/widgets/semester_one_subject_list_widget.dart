import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';
import '../../logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_cubit.dart';
import '../../logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_state.dart';
class SemesterOneSubjectListWidget extends StatefulWidget {
  const SemesterOneSubjectListWidget({
    Key? key,
    required this.token,
    required this.yearId,
    required this.semesterId,
  }) : super(key: key);

  final String token;
  final int yearId, semesterId;

  @override
  State<SemesterOneSubjectListWidget> createState() =>
      _SemesterOneSubjectListWidgetState();
}

class _SemesterOneSubjectListWidgetState
    extends State<SemesterOneSubjectListWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
setState(() {
  context
      .read<GetAllMaterialByTermIdCubit>()
      .emitGetAllMaterialByTermIdStates(termId: widget.semesterId);
});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMaterialByTermIdCubit, GetAllMaterialByTermIdState>(
      builder: (context, state) {
        return state.when(
          success: (data) {
            List<GetAllMaterialByTermIdModel> getAllMaterialByTermIdModel = data;
            return ListView.builder(
              itemCount: getAllMaterialByTermIdModel.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsManager.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getAllMaterialByTermIdModel[index].name.toString(),
                          style: TextStyles.font16SemiBoldBlack,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showDeleteConfirmationDialog(context, index);
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text('Error: $error')),
          initial: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    final deleteSubject = context.read<DeleteGradeCubit>();
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Delete Subject'),
          content: const Text('Are you sure you want to delete this subject?'),
          actions: <Widget>[
            AppTextButton(
              buttonHeight: 25.r,
              buttonWidth: 60.r,
              textButton: "Delete",
              onPressed: () {
                // Delete the subject from the list
                setState(() {
                  deleteSubject.emitDeleteGradeStates(
                      token: widget.token, yearId: widget.yearId);
                  // You may also remove the item from the list in the Bloc state
                  // and rebuild the list here instead of refetching the data
                });
                Navigator.of(dialogContext).pop();
              },
            ),
            verticalSpacing(10),
            AppTextButton(
              buttonHeight: 25.r,
              buttonWidth: 60.r,
              textButton: S.of(context).cancel,
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

