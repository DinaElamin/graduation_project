import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../features/manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';

class SemesterTwoWidget extends StatefulWidget {
  const SemesterTwoWidget({Key? key, required this.onSubjectsSelected}) : super(key: key);
  final void Function(List<String>) onSubjectsSelected;

  @override
  State<SemesterTwoWidget> createState() => _SemesterTwoWidgetState();
}

class _SemesterTwoWidgetState extends State<SemesterTwoWidget> {
  List<String> selectedClassIds = []; // Track selected class IDs

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
              List<GetAllClassesModel> getAllClassesModel = data;
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
                                S.of(context).class_code,
                                style: TextStyles.font16SemiBoldBlack.copyWith(
                                  color: ColorsManager.mainWhite,
                                ),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                        items: getAllClassesModel.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.classId.toString(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.className.toString(),
                                  style: TextStyles.font16SemiBoldBlack.copyWith(
                                    color: ColorsManager.mainBlack,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Container(
                                  width: 25.w,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: selectedClassIds.contains(item.classId)
                                        ? ColorsManager.greenColor
                                        : Colors.transparent, // Change color based on selection
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      size: 18.sp,
                                      color: ColorsManager.mainWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            String selectedValue = value!;

                            // Toggle selection
                            if (selectedClassIds.contains(selectedValue)) {
                              selectedClassIds.remove(selectedValue);
                            } else {
                              selectedClassIds.add(selectedValue);
                            }
                            widget.onSubjectsSelected(selectedClassIds);
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
