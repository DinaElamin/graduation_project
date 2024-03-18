import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SemesterOneDropDown extends StatefulWidget {
  const SemesterOneDropDown({Key? key}) : super(key: key);

  @override
  State<SemesterOneDropDown> createState() => _SemesterOneDropDownState();
}

class _SemesterOneDropDownState extends State<SemesterOneDropDown> {
  final List<String> items = ['Math', 'English', 'Arabic', 'Science'];
  String? selectedValue;
  List<String> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Row(
                children: [
                  Expanded(
                    child: Text(
                       S.of(context).choose_the_subject,
                      style: TextStyles.font16SemiBoldBlack.copyWith(
                        color: ColorsManager.mainWhite,
                      ),
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
                  style: TextStyles.font16SemiBoldBlack.copyWith(
                    color: ColorsManager.mainWhite,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
                if (value != null && !selectedSubjects.contains(value)) {
                  selectedSubjects.add(value);
                }
              },
              buttonStyleData: ButtonStyleData(
                height: 60.h,
                width: double.infinity,
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
              menuItemStyleData: MenuItemStyleData(
                height: 40.h,
                padding: EdgeInsets.only(left: 14.w, right: 14.w),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.mainWhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: selectedSubjects
                  .map(
                    (subject) => Chip(
                      padding: EdgeInsets.all(20.sp),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subject,
                        style:
                       TextStyles.font16SemiBoldBlack,
                      ),
                    
                    ],
                  ),
                  backgroundColor: ColorsManager.grey,
                  deleteIconColor: Colors.black,
                  deleteIcon:Icon( Icons.delete,size: 25.sp),

                  onDeleted: () {
                    setState(() {
                      selectedSubjects.remove(subject);
                    });
                  },
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
