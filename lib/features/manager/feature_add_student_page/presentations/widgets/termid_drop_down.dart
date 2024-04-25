import '../../../../../core/theming/colors.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class TermIdDropDown extends StatefulWidget {
  const TermIdDropDown({Key? key, required this.onTermIdSelected}) : super(key: key);
  final void Function(String) onTermIdSelected; // Callback function to handle selected term ID
  @override
  State<TermIdDropDown> createState() => _TermIdDropDownState();
}

class _TermIdDropDownState extends State<TermIdDropDown> {
  DropListModel dropListModel = DropListModel([
    OptionItem(id: '1', title: "Semester One"),
    OptionItem(id: '2', title: "Semester Two"),

  ]);
  OptionItem optionItemSelected = OptionItem(title: "Select Term");


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          SelectDropList(
            height: 60.sp,
            width: double.infinity,
            itemSelected:optionItemSelected,
            dropListModel:dropListModel,
            showIcon: false,     // Show Icon in DropDown Title
            showArrowIcon: true,     // Show Arrow Icon in DropDown
            showBorder: true,
            paddingTop: 0,
            dropboxColor: ColorsManager.mainColor,
            textColorItem: ColorsManager.mainWhite,
            textColorTitle: ColorsManager.mainWhite,
            arrowColor: ColorsManager.mainWhite,
            dropbBoxborderRadius:BorderRadius.circular(16.sp),
            heightBottomContainer: 80.r,
            containerDecoration: BoxDecoration(
                color: ColorsManager.mainColor,borderRadius: BorderRadius.circular(16.sp)),
            hintColorTitle: ColorsManager.mainWhite,
            onOptionSelected:(optionItem){
              optionItemSelected = optionItem;
              setState(() {
                optionItemSelected = optionItem;
                widget.onTermIdSelected(optionItem.id.toString()); // Pass the selected ID to the callback function
              });
            },
          )
        ],
      ),

    );
  }
}
