import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';




class DropDownMenuGrade extends StatefulWidget {
  const DropDownMenuGrade({super.key});

  @override
  State<DropDownMenuGrade> createState() => _DropDownMenuGradeState();
}

class _DropDownMenuGradeState extends State<DropDownMenuGrade> {
  final List<String> items = [
    'Grade1',
    'Grade2',
    'Grade3',
    'Grade4',
    'Grade5',
    'Grade6',
    'Grade7',
    'Grade8',
    'Grade9',
    'Grade10',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint:  Row(
              children: [

                Expanded(
                  child: Text(
                    S.of(context).grade,
                    style:  TextStyles.font16SemiBoldBlack.copyWith(color: ColorsManager.mainWhite),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: items
                .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style:  TextStyles.font16SemiBoldBlack.copyWith(color: ColorsManager.mainWhite),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: ButtonStyleData(

              height: 60.h,
              width: double.infinity,
              padding:  EdgeInsets.only(left: 14.w, right: 14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: ColorsManager.mainColor,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
              ),
              iconSize: 21,
              iconEnabledColor: ColorsManager.mainWhite,
              iconDisabledColor:ColorsManager.mainWhite,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200.h,
              width: 300.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: ColorsManager.mainColor,
              ),
              offset: const Offset(5, -0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData:  MenuItemStyleData(
              height: 40.h,
              padding: EdgeInsets.only(left: 14.w, right: 14.w),
            ),
          ),
        ),

    );
  }
}