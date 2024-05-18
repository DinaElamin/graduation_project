import 'package:ablexa/core/di/dependacy_injection.dart';
import 'package:ablexa/features/manager/feature_add_student_page/data/models/get_all_semester_model/get_all_year_model.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_state.dart';
import 'package:ablexa/features/manager/feature_grades_page/logic/cubits/delete_grade_cubit/delete_grade_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper/extentions.dart';
import 'package:flutter/material.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/grade_widget.dart';

class GradesPage extends StatefulWidget {
  const GradesPage({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  @override
  void initState() {
    super.initState();
    // Trigger the cubit's method when the widget is initialized
    context.read<GetAllYearDataCubit>().emitAllYearStates();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.mainColor,
        onPressed: () {
          context.pushNamed(Routes.addGradePage, arguments: widget.token);
        },
        child: const Icon(Icons.add, color: ColorsManager.mainWhite),
      ),
      appBar: AppBar(
        title: Text(S.of(context).grades),
        elevation: 0,
        backgroundColor: ColorsManager.mainWhite,
        foregroundColor: ColorsManager.mainBlack,
      ),
      body: BlocBuilder<GetAllYearDataCubit, GetAllYearDataState>(
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
      ),
    );
  }

  setupErrorState(BuildContext context, String error) {
    context.pop();
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
                context.pop();
              },
              child: Text(
                'Got It ',
                style: TextStyles.font20BoldBlack,
              )),
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
