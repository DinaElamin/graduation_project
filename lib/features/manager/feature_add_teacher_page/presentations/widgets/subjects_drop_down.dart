import 'package:ablexa/features/manager/feature_add_teacher_page/data/models/get_all_materail_model/get_all-matrial_model.dart';
import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_state.dart';
import '../../../../../core/theming/colors.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/styles.dart';
import '../../logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
class SubjectsDropDown extends StatefulWidget {
  const SubjectsDropDown({Key? key, required this.onSubjectSelected}) : super(key: key);
  final void Function(String) onSubjectSelected; // Callback function to handle selected grade

  @override
  State<SubjectsDropDown> createState() => _SubjectDropDownState();
}

class _SubjectDropDownState extends State<SubjectsDropDown> {
  // Initialize the selected option item
  OptionItem optionItemSelected = OptionItem(title: "Subject");

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
    context.read<GetAllMaterialDataCubit>().emitAllMaterialStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMaterialDataCubit, GetAllMaterialDataState>(
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
            final List<GetAllMaterialModel> getAllMaterialModel = data;
            // Extract names from the model and update the dropdown items list
            List<OptionItem> dropListItems = getAllMaterialModel.map((model) {
              return OptionItem(id: "1", title: model.subject_Name ?? '');
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
                        widget.onSubjectSelected(optionItem.id.toString()); // Pass the selected ID to the callback function
                      });
                    },
                  )
                ],
              ),
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