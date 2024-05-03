import 'package:ablexa/features/manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import 'package:ablexa/features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_state.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
class ClassesDropDown extends StatefulWidget {
  const ClassesDropDown({Key? key, required this.onSubjectsSelected}) : super(key: key);
  final void Function(List<String>) onSubjectsSelected;
  @override
  State<ClassesDropDown> createState() => _ClassesDropDownState();
}

class _ClassesDropDownState extends State<ClassesDropDown> {
  int? selectedValue;
  late List<GetAllClassesModel> getAllClassesModel;
  late Map<String, int> nameToIdMap;
  late List<int> selectedClassIds = []; // Track selected class IDs

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
    context.read<GetAllClassesDataCubit>().emitAllClassesStates();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlocBuilder<GetAllClassesDataCubit, GetAllClassesDataState>(
            builder: (context, state) {
              return state.when(
                success: (data) {
                  getAllClassesModel = data;
                  nameToIdMap = Map.fromEntries(
                    getAllClassesModel.map((item) => MapEntry(item.className.toString(), item.classId!)),
                  );

                  return Column(
                    children: [
                      IntrinsicWidth(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint:  Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    S.of(context).choose_the_subject,
                                    style: TextStyles.font16SemiBoldBlack.copyWith(
                                      color: ColorsManager.mainWhite,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                            items: getAllClassesModel.map((item) { // Use getAllClassesModel directly
                              return DropdownMenuItem<String>(
                                value: item.classId.toString(), // Use classId as value
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.className.toString(), // Display className in the dropdown
                                      style: TextStyles.font16SemiBoldBlack.copyWith(
                                        color: ColorsManager.mainBlack, // Adjust text color if needed
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      width: 25.w,
                                      height: 25.h,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorsManager.greenColor,
                                      ),
                                      child: Center(child: Icon(
                                        size: 18.sp,

                                        Icons.add,color: ColorsManager.mainWhite,)),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = int.parse(value!); // Parse value back to int
                                selectedClassIds = [selectedValue!]; // Update selected class IDs list
                                List<String> selectedClassIdsAsString = selectedClassIds.map((id) => id.toString()).toList(); // Convert to List<String>
                                widget.onSubjectsSelected(selectedClassIdsAsString); // Pass the updated list of strings to the callback
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
        ],
      ),
    );
  }
}

