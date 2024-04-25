import '../../../../../core/theming/colors.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/styles.dart';
import '../../../feature_home_manager_page/data/models/get_all_classes_model/get_all_classes_model.dart';
import '../../../feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_cubit.dart';
import '../../../feature_home_manager_page/logic/cubits/get_all_classes_cubit/get_all_classes_state.dart';

class GradeDropDown extends StatefulWidget {
  const GradeDropDown({Key? key, required this.onGradeSelected}) : super(key: key);
  final void Function(String) onGradeSelected; // Callback function to handle selected grade

  @override
  State<GradeDropDown> createState() => _GradeDropDownState();
}

class _GradeDropDownState extends State<GradeDropDown> {
  // Initialize the selected option item
  OptionItem optionItemSelected = OptionItem(title: "Select Grade");

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
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
            // Extract names from the model and update the dropdown items list
            List<OptionItem> dropListItems = getAllClassesModel.map((model) {
              return OptionItem(id: model.classId.toString(), title: model.className ?? '');
            }).toList();

            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  SelectDropList(
                    height: 60.sp,
                    width: double.infinity,
                    itemSelected: optionItemSelected,
                    dropListModel: DropListModel(dropListItems),
                    showIcon: false, // Show Icon in DropDown Title
                    showArrowIcon: true, // Show Arrow Icon in DropDown
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
                      optionItemSelected = optionItem;
                      setState(() {
                        optionItemSelected = optionItem;
                        widget.onGradeSelected(optionItem.id.toString()); // Pass the selected ID to the callback function
                      });
                    },
                  )
                ],
              ),
            );
          },
          error: (error) {
            return AlertDialog(
              content: Text(
                error.toString(),
                style: TextStyles.font14MediumLightBlack,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Got It',
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
          },
        );
      },
    );
  }
}
