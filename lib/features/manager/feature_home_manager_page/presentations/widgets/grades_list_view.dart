import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/dependacy_injection.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../feature_add_student_page/data/models/get_all_semester_model/get_all_year_model.dart';
import '../../../feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import '../../../feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_state.dart';
import '../../../feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import '../../../feature_grades_page/presentations/widgets/grade_widget.dart';
class GradesListView extends StatefulWidget {
  const GradesListView({super.key, required this.token});
final String token;
  @override
  State<GradesListView> createState() => _GradesListViewState();
}

class _GradesListViewState extends State<GradesListView> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      context.read<GetAllYearDataCubit>().emitAllYearStates();
    });
    return     BlocBuilder<GetAllYearDataCubit, GetAllYearDataState>(
      builder: (context, state) {
        return state.when(initial: () {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),
          );
        }, success: (data) {
          final List<GetAllYearModel> getAllYearModel = data;
          return ListView.builder(
            itemCount: getAllYearModel.length,
            itemBuilder: (context, index) => BlocProvider(
              create: (context) => getIt<DeleteGradeCubit>(),
              child: GradeWidget(
                token: widget.token,
                yearId: getAllYearModel[index].id!,
                gradeName: getAllYearModel[index].name.toString(),
              ),
            ),
          );
        }, error: (error) {
          return setupErrorState(context, error);
        });
      },
    );
  }
   setupErrorState(BuildContext context, String error) {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          error,
          style: TextStyles.font14MediumLightBlack,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Got It ',
              style: TextStyles.font20BoldBlack,
            ),
          ),
        ],
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }
}
