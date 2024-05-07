import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/app_text_feild.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';

class TextFormFieldProfileManager extends StatelessWidget {
  const TextFormFieldProfileManager({
    Key? key,
    required this.nameManager,
    required this.emailManager,
    required this.nationalId,
  }) : super(key: key);

  final String nameManager, emailManager, nationalId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).user_name,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: nameManager,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_name_warning;
              }
              return null; // Return null if the value is valid
            },
          ),
          verticalSpacing(10),
          Text(
            S.of(context).email,
            style: TextStyles.font16SemiBoldBlack,
          ),
          verticalSpacing(10),
          AppTextFormField(
            hintText: emailManager,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_email_warning;
              } else if (!value.contains('@')) {
                return S.of(context).invalid_email_warning;
              }
              return null; // Return null if the value is valid
            },
          ),
          verticalSpacing(10),
          Text(
            S.of(context).national_iD,
            style: TextStyles.font16SemiBoldBlack,
          ),
          AppTextFormField(
            hintText: nationalId,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).national_iD;
              }
              return null; // Return null if the value is valid
            },
          ),
          verticalSpacing(10),
        ],
      ),
    );
  }
}
