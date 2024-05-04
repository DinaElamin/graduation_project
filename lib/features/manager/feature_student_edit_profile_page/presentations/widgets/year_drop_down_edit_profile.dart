import 'package:ablexa/features/manager/feature_add_student_page/data/models/get_all_semester_model/get_all_year_model.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_cubit.dart';
import 'package:ablexa/features/manager/feature_add_student_page/logic/cubits/get_all_semester_cubit/get_all_year_state.dart';
import '../../../../../core/theming/colors.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';
class EditProfileYearDropDown extends StatefulWidget {
  const EditProfileYearDropDown({Key? key, required this.onSemesterSelected}) : super(key: key);
  final void Function(String) onSemesterSelected; // Callback function to handle selected grade

  @override
  State<EditProfileYearDropDown> createState() => _EditProfileYearDropDownState();
}

class _EditProfileYearDropDownState extends State<EditProfileYearDropDown> {
  // Initialize the selected option item
  OptionItem optionItemSelected = OptionItem(title: "Select Year");

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
    context.read<GetAllYearDataCubit>().emitAllYearStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllYearDataCubit, GetAllYearDataState>(
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
            final List<GetAllYearModel> getAllSemesterModel = data;
            // Extract names from the model and update the dropdown items list
            List<OptionItem> dropListItems = getAllSemesterModel.map((model) {
              return OptionItem(id: model.id.toString(), title: model.name ?? '');
            }).toList();

            return Column(
              children: <Widget>[
                SelectDropList(
                  height: 60.sp,
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
                      widget.onSemesterSelected(optionItem.id.toString()); // Pass the selected ID to the callback function
                    });
                  },
                )
              ],
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
