import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/shared_widgets/app_elevated_button.dart';
import 'package:ablexa/core/shared_widgets/app_text_feild.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/data/models/get_semester_by_term_id_model/get_semester_by_year_id_model.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/add_class_cubit/add_class_cubit.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/get_semester_by_year_id_cubit/get_semester_by_year_id_cubit.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/get_semester_by_year_id_cubit/get_semester_by_year_id_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../logic/cubits/add_class_cubit/add_class_state.dart';
import '../widgets/semester_widget.dart';

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
  String _className = ''; // Store the entered class name

  @override
  Widget build(BuildContext context) {
    setState(() {
      context
          .read<GetSemesterByIdCubit>()
          .emitGetSemesterByYearIdStates(yearId: widget.materialid);
    });
    return Scaffold(
      body: ListView(
        children: [
          addClassCubitWidget(context),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: semesterCubit(),
          )
        ],
      ),
    );
  }

  BlocBuilder<GetSemesterByIdCubit, GetSemesterByIdState<dynamic>> semesterCubit() {
    return BlocBuilder<GetSemesterByIdCubit, GetSemesterByIdState>(
      builder: (context, state) {
        return state.when(loading: () {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),
          );
        }, success: (data) {
          final List<GetSemesterByYearIdModel>
          getSemesterByYearIdModel = data;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: getSemesterByYearIdModel.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SemesterWidget(
                semesterId: getSemesterByYearIdModel[index].id,
                token: widget.token,
                semesterName: getSemesterByYearIdModel[index].termName,
                gradeName: widget.gradeName,
                yearId: widget.materialid,
              ),
            ),
          );
        }, error: (error) {
          return setupErrorState(context, error);
        }, initial: () {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),
          );
        });
      },
    );
  }

  BlocListener<AddClassCubit, AddClassState<dynamic>> addClassCubitWidget(
      BuildContext context) {
    return BlocListener<AddClassCubit, AddClassState>(
      child: AppBarWidget(
        pageName: widget.gradeName,
        widget: GestureDetector(
          onTap: () {
            _showAddClassDialog(context);
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
      ),
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
            Navigator.of(context).pop(); // Close the loading dialog
            showSuccessDialog(context,
                text: "Success",
                contentText: "The Class Added Success !", onPressed: () {
              context.pop();
            }); // Show the success dialog
          },
          error: (error) {
            setupErrorState(context, error); // Show the error dialog
          },
        );
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

  Future<void> _showAddClassDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Add Class', style: TextStyles.font20BoldBlack),
          content: AppTextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Class name is required';
              }
              return null; // Return null if the input is valid
            },
            onChange: (value) {
              _className = value;
            },
            hintText: 'Enter the class name',
          ),
          actions: <Widget>[
            AppTextButton(
                buttonHeight: 25.r,
                buttonWidth: 60.r,
                textButton: "Add",
                onPressed: () {
                  context
                      .read<AddClassCubit>()
                      .emitAddClassStates(widget.token, name: _className);
                  Navigator.of(dialogContext).pop();
                }),
            verticalSpacing(10),
            AppTextButton(
                buttonHeight: 25.r,
                buttonWidth: 60.r,
                textButton: S.of(context).cancel,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                }),
          ],
        );
      },
    );
  }
}
