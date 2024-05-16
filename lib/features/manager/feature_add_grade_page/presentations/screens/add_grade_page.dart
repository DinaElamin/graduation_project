import 'package:ablexa/features/manager/feature_add_grade_page/logic/cubits/add_year_cubit/add_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/presentations/widgets/index_and_year_name_text_form_field.dart';
import 'package:ablexa/features/manager/feature_add_grade_page/presentations/widgets/semester_two_widget_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/semester_one_widget.dart';

class AddGradePage extends StatefulWidget {
  const AddGradePage({Key? key, required this.token}) : super(key: key);
final String token;
  @override
  State<AddGradePage> createState() => _AddGradePageState();
}

class _AddGradePageState extends State<AddGradePage> {

late int indexOfYearName;
late String GradeName;
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
                   IndexAndYearNameTextFormField(
                    onChanged: (index, yearName) {
                      setState(() {
                        indexOfYearName = index;
                        GradeName= yearName;
                      });
                    },
                  ),
                   SemesterOneWidget(
                       onSubjectsSelected: (subject) {
                         setState(() {
                           SemesterOneMaterial = subject;
                           print("the subject choose is :$subject");
                         });
                       }
                   ),
                   SemesterTwoWidget(
                       onSubjectsSelected: (subject) {
                         setState(() {
                           SemesterTwoMaterial = subject;
                           print("the subject choose is :$subject");
                         });
                       }
                   ),
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
      padding: EdgeInsets.only(left: 50.w, right: 50.w),
      child: AppTextButton(
        textButton: S.of(context).save,
        onPressed: () {
          validateThenDoAddGrade(context);
        },
      ),
    );
  }




  void validateThenDoAddGrade(BuildContext context) {
    if (context.read<AddYearCubit>().formKey.currentState!.validate()) {
      context.read<AddYearCubit>().emitAddYearStates(
          widget.token,
          Index: indexOfYearName,
          YearName: GradeName,
          FirstSemesterMaterial: SemesterOneMaterial,
          SecondSemesterMaterial: SemesterTwoMaterial);
      print("Validation successful. Navigating to gradePage");

    } else {
      print("Validation failed. Please check the form fields.");
    }
  }
}
