import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SemesterDropDown extends StatefulWidget {
  const SemesterDropDown({Key? key}) : super(key: key);

  @override
  State<SemesterDropDown> createState() => _SemesterOneDropDownState();
}

class _SemesterOneDropDownState extends State<SemesterDropDown> {
  final List<String> items = ['Math', 'English', 'Arabic', 'Science'];
  String? selectedValue;
  List<String> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          IntrinsicWidth( // Use IntrinsicWidth to make the container width match the DropdownButton width
            child: DropdownButtonHideUnderline(
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
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                items: items
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item,
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
                          color: ColorsManager.greenColor,
                        ),
                        child: Center(child: Icon(
                          size: 18.sp,

                          Icons.add,color: ColorsManager.mainWhite,)),
                      ),
                    ],
                  ),
                ))
                    .toList(),

                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                  if (value != null && !selectedSubjects.contains(value)) {
                    selectedSubjects.add(value);
                  }
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
          SizedBox(height: 20.h),
          Container(
            width: double.infinity, // Set container width to match DropdownButton width
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
                        style: TextStyles.font16SemiBoldBlack,
                      ),
                    ],
                  ),
                  backgroundColor: ColorsManager.grey,
                  deleteIconColor: Colors.black,
                  deleteIcon: Container(
                    width: 35.w,
                    height: 35.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.redColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.remove,
                        size: 15.sp,
                        color: ColorsManager.mainWhite,
                      ),
                    ),
                  ),


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
