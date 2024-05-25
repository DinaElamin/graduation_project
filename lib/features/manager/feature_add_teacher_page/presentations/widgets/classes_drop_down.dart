import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../../../../features/manager/feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_state.dart';
import '../../../../../features/manager/feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';

class ClassesDropDown extends StatefulWidget {
  const ClassesDropDown({Key? key, required this.onSubjectsSelected}) : super(key: key);
  final void Function(List<String>) onSubjectsSelected;

  @override
  State<ClassesDropDown> createState() => _ClassesDropDownState();
}

class _ClassesDropDownState extends State<ClassesDropDown> {
  List<String> selectedClassIds = []; // Track selected class IDs
  OptionItem optionItemSelected = OptionItem(title: "Class");

  @override
  void initState() {
    super.initState();
    context.read<GetAllClassesDataCubit>().emitAllClassesStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllClassesDataCubit, GetAllClassesDataState>(
      builder: (context, state) {
        return state.when(
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
              final List<GetAllClassesModel> getAllClassesModel = data;
              List<OptionItem> dropListItems = getAllClassesModel.map((model) {
                return OptionItem(id: model.classId.toString(), title: model.className ?? '');
              }).toList();

              return Column(
                children: <Widget>[
                  SelectDropList(
                    height: 60.sp,
                    itemSelected: optionItemSelected,
                    dropListModel: DropListModel(dropListItems),
                    showIcon: false,
                    showArrowIcon: true,
                    showBorder: true,
                    paddingTop: 0,
                    dropboxColor: ColorsManager.mainColor,
                    textColorItem: ColorsManager.mainWhite,
                    textColorTitle: ColorsManager.mainWhite,
                    arrowColor: ColorsManager.mainWhite,
                    dropbBoxborderRadius: BorderRadius.circular(16.sp),
                    heightBottomContainer: 80.r,
                    containerDecoration: BoxDecoration(
                      color: ColorsManager.mainColor,
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    hintColorTitle: ColorsManager.mainWhite,
                    onOptionSelected: (optionItem) {
                      setState(() {
                        if (selectedClassIds.contains(optionItem.id)) {
                          selectedClassIds.remove(optionItem.id); // Remove ID if already selected
                        } else {
                          selectedClassIds.add(optionItem.id!); // Add ID if not selected
                        }
                        optionItemSelected = optionItem;
                        widget.onSubjectsSelected(selectedClassIds); // Pass all selected class IDs
                      });
                    },
                  )
                ],
              );
            },
            error: (error) {
              return setupErrorState(context, error);
            }
        );
      },
    );
  }

  Widget setupErrorState(BuildContext context, String error) {
    return AlertDialog(
      content: Text(
        error,
        style: TextStyles.font14MediumLightBlack,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the AlertDialog
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
    );
  }
}
