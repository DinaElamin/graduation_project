import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_state.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/presentations/widgets/index_and_year_name_text_form_field.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/presentations/widgets/semester_two_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/semester_one_widget.dart';

class AddGradePage extends StatefulWidget {
  const AddGradePage({Key? key, required this.token}) : super(key: key);
final String token;
  @override
  State<AddGradePage> createState() => _AddGradePageState();
}

class _AddGradePageState extends State<AddGradePage> {


late List<String> SemesterOneMaterial;
late List<String> SemesterTwoMaterial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).add_grade),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: context.read<AddYearCubit>().formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(40),
                   const IndexAndYearNameTextFormField(),
                   verticalSpacing(10),
                  Text(S.of(context).semester_one_subject, style: TextStyles.font16SemiBoldBlack),
                 verticalSpacing(10),
                  SemesterOneWidget(
                    onSubjectsSelected: (subject) {
                      setState(() {
                        SemesterOneMaterial = subject;
                        print("Semester one subjects selected: $subject");
                      });
                    },
                  ),


                  verticalSpacing(10),
                  Text(S.of(context).semester_two_subject, style: TextStyles.font16SemiBoldBlack),
                  verticalSpacing(10),
                  SemesterTwoWidget(
                    onSubjectsSelected: (subject) {
                      setState(() {
                        SemesterTwoMaterial = subject;
                        print("Semester two subjects selected: $subject");
                      });
                    },
                  ),
                  verticalSpacing(30),
                  saveButton(context),
                  verticalSpacing(20),
                  // Add more widgets here as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


Padding saveButton(BuildContext context) {
  return Padding(
    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
    child: BlocListener<AddYearCubit,AddYearState>(
      listener: (context, state) {
        state.when(
          initial: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          },
          success: (data) {

            showSuccessDialog(
                onPressed: (){
                  context.pop();
                  },
                context,
                text: S.of(context).add_grade,
                contentText: "Add Grade Successfully !!");
          },
            error: (error) {
              setupErrorState(context, error);
            }
        );
      },
      child: AppTextButton(
          buttonHeight: 60.h,
          textButton: S.of(context).add_grade, onPressed: (){
        validateThenDoAddGrade(context);
      }),
    ),
  );

  }





  void validateThenDoAddGrade(BuildContext context) {
    if (context.read<AddYearCubit>().formKey.currentState!.validate()) {
      context.read<AddYearCubit>().emitAddYearStates(
          widget.token,
          Index: int.parse(context.read<AddYearCubit>().indexController.text),          YearName: context.read<AddYearCubit>().yearNameController.text,
          FirstSemesterMaterial: SemesterOneMaterial,
          SecondSemesterMaterial: SemesterTwoMaterial);

    } else {
      print("Validation failed. Please check the form fields.");
    }
  }
void setupErrorState(BuildContext context, String error) {
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
