import 'package:ablexa/features/manager/feature_add_teacher_page/data/models/get_all_materail_model/get_all-matrial_model.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class SemesterTwoWidgetGradeDetails extends StatefulWidget {
  const SemesterTwoWidgetGradeDetails({Key? key}) : super(key: key);


  @override
  State<SemesterTwoWidgetGradeDetails> createState() => _SemesterTwoWidgetGradeDetailsState();
}

class _SemesterTwoWidgetGradeDetailsState extends State<SemesterTwoWidgetGradeDetails> {
  List<String> selectedSubjects = []; // Track selected subjects

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
    context.read<GetAllMaterialDataCubit>().emitAllMaterialStates();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<GetAllMaterialDataCubit, GetAllMaterialDataState>(
        builder: (context, state) {
          return state.when(
            success: (data) {
              List<GetAllMaterialModel> getAllMaterialModel = data;
              return Column(
                children: [
                  IntrinsicWidth(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            Expanded(
                              child: Text(
                                S.of(context).semester_two,
                                style: TextStyles.font16SemiBoldBlack.copyWith(
                                  color: ColorsManager.mainWhite,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                        items: getAllMaterialModel.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.subject_Name.toString(), // Use subject name as value
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.subject_Name.toString(),
                                  style: TextStyles.font16SemiBoldBlack.copyWith(
                                    color: ColorsManager.mainBlack,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Container(
                                  width: 25.w,
                                  height: 25.h,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:  ColorsManager.redColor
                                  ),
                                  child: Center(
                                    child: Icon(
                                        Icons.minimize_rounded,
                                        size: 10.sp,
                                        color:ColorsManager.mainWhite
                                      // Change icon color based on selection
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            if (value != null) {
                              // Toggle selection using subject name
                              if (selectedSubjects.contains(value)) {
                                selectedSubjects.remove(value); // Remove if already selected
                              } else {
                                selectedSubjects.add(value); // Add if not selected
                              }
                              // Pass the updated list of selected subjects back to the parent widget
                            }
                          });
                        },

                        buttonStyleData: ButtonStyleData(
                          width: 400.w,
                          height: 60.h,
                          padding: EdgeInsets.only(left: 14.w, right: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: ColorsManager.mainColor,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: IconStyleData(
                          icon: const Icon(
                            Icons.arrow_drop_down,
                          ),
                          iconSize: 21.sp,
                          iconEnabledColor: ColorsManager.mainWhite,
                          iconDisabledColor: ColorsManager.mainWhite,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: ColorsManager.grey,
                          ),
                          offset: const Offset(5, -0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility: MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          height: 40.h,
                          padding: EdgeInsets.only(left: 14.w, right: 14.w),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error) => Text('Error: $error'),
            initial: () => const CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
