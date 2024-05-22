import 'package:ablexa/core/helper/extentions.dart';
import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/add_material_degree_cubit/add_material_degree_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/setup_error.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../feature_garde_details_page/logic/cubits/add_material_degree_cubit/add_material_degree_cubit.dart';

class AddDegreeFromMaterial extends StatefulWidget {
  const AddDegreeFromMaterial({
    Key? key,
    required this.gradeName,
    required this.semesterName,
    required this.token,
    required this.materialid,
  }) : super(key: key);

  final String gradeName, semesterName, token;
  final int materialid;

  @override
  _AddDegreeFromMaterialState createState() => _AddDegreeFromMaterialState();
}

class _AddDegreeFromMaterialState extends State<AddDegreeFromMaterial> {
  late String enteredDegree = ''; // Variable to capture the entered degree

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
            pageName: widget.gradeName,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 20.sp,
              right: 20.sp,
              bottom: 20.sp,
              top: 20.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.semesterName,
                  style: TextStyles.font20BoldBlack,
                ),
                verticalSpacing(20),
                GestureDetector(
                  onTap: () {
                    _showDegreeDialog(context);
                  },
                  child: enterGradeWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container enterGradeWidget() {
    return Container(
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
              widget.gradeName,
              style: TextStyles.font16SemiBoldBlack,
            ),
            BlocListener<AddMaterialGradeCubit, AddMaterialDegreeState>(
              child: Text(
                enteredDegree.isNotEmpty ? enteredDegree : 'Enter degree',
                style: TextStyles.font12RegularPurple,
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
                      contentText: "The Degree Added Success !",
                      onPressed: (){
                      context.pop();
                      }
                    ); // Show the success dialog
                  },
                  error: (error) {
                    Navigator.of(context).pop(); // Close the loading dialog
                    setupErrorState(context, error); // Show the error dialog
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDegreeDialog(BuildContext context) async {
    enteredDegree = ''; // Clear the previous entered degree
    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        final addMaterialGradeCubit =
        context.read<AddMaterialGradeCubit>();
        return AlertDialog(
          title: Text(
            'Enter Degree From ${widget.gradeName}',
          ),
          content: TextField(
            decoration: InputDecoration(hintText: 'Degree'),
            onChanged: (value) {
              setState(() {
                enteredDegree = value;
              });
            },
          ),
          actions: <Widget>[
            AppTextButton(
                buttonHeight: 25.r,
                buttonWidth: 60.r,
                textButton: "Save", onPressed: (){
              addMaterialGradeCubit.emitAddMaterialDegreeStates(
                widget.token,
                materialid: widget.materialid,
                M_grade: int.parse(enteredDegree),
              );
              Navigator.of(dialogContext).pop();
            }),
            verticalSpacing(10),
            AppTextButton(
                buttonHeight: 25.r,
                buttonWidth: 60.r,
                textButton: S.of(context).cancel, onPressed: (){
              Navigator.of(dialogContext).pop();
            }),

          ],
       
        );
      },
    );
  }


}
