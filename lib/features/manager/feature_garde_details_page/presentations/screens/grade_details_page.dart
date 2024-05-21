import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/add_class_cubit/add_class_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_class_cubit/add_class_state.dart';
import '../widgets/semester_one_widget_grade_details.dart';
import '../widgets/semester_two_widget_grade_details.dart';

class GradeDetailsPage extends StatefulWidget {
  const GradeDetailsPage({
    Key? key,
    required this.gradeName,
    required this.materialid,
    required this.token,
  }) : super(key: key);

  final String gradeName, token;
  final int materialid;

  @override
  State<GradeDetailsPage> createState() => _GradeDetailsPageState();
}

class _GradeDetailsPageState extends State<GradeDetailsPage> {
  bool _isAddingClass =
      false; // Track whether the user is adding a class or not
  String _className = ''; // Store the entered class name

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
            pageName: S.of(context).grade_details,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(50),
                Text(
                  widget.gradeName,
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(50),
                Text(S.of(context).semester_one_subject,
                    style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                 SemesterOneWidgetGradeDetails(
                  token: widget.token,
                  yearId: widget.materialid,
                ),
                verticalSpacing(50),
                Text(S.of(context).semester_two_subject,
                    style: TextStyles.font16SemiBoldBlack),
                verticalSpacing(10),
                const SemesterTwoWidgetGradeDetails(),
                verticalSpacing(50),
                _isAddingClass
                    ? Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: AppTextFormField(
                          textInputType: TextInputType.text,
                          hintText: 'Enter class name',
                          validator: (p0) {},
                          onChange: (value) {
                            _className = value; // Store the entered class name
                          },
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            _isAddingClass = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 20.w,
                              height: 20.h,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsManager.mainColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 10,
                                  color: ColorsManager.mainWhite,
                                ),
                              ),
                            ),
                            horizontalSpacing(10),
                            Text(
                              "Add Class",
                              style: TextStyles.font20BoldBlack,
                            ),
                          ],
                        ),
                      ),
                if (_isAddingClass)
                  BlocListener<AddClassCubit, AddClassState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        loading: () {
                          showDialog(
                            context: context,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(
                                color: ColorsManager.mainColor,
                              ),
                            ),
                          );
                        },
                        success: (data) {
                          Navigator.of(context).pop();
                        },
                        error: (error) {
                          setupErrorState(context, error);
                        },
                      );
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        // Pass the entered class name to the AddClassCubit
                        context
                            .read<AddClassCubit>()
                            .emitAddClassStates(widget.token, name: _className);
                        setState(() {
                          _isAddingClass = false;
                        });
                      },
                      child: Text('Save Class'),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
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
