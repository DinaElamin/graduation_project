import '../../../../../core/helper/extentions.dart';

import '../../../../../core/Routing/routers.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/shared_widgets/success_widget.dart';
import '../../../../../core/theming/spacing.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/upload_exam_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/add_exam_text_form_fields.dart';

class AddExamPage extends StatefulWidget {
  const AddExamPage({Key? key}) : super(key: key);

  @override
  State<AddExamPage> createState() => _AddExamPageState();
}

class _AddExamPageState extends State<AddExamPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).add_exam),
          verticalSpacing(50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const AddExamTextFormFields(),
                  const UploadExamImageWidget(),
                  Padding(
                    padding:  EdgeInsets.only(left: 50.w,right: 50.w),
                    child: AppTextButton(textButton: S.of(context).add_exam, onPressed: (){

                      if(formKey.currentState!.validate()){
                        showSuccessDialog(
                            onPressed: (){
                              context.pop();
                              context.pushNamed(Routes.studentExamsPage,arguments: 2);
                            },
                            context,
                            text: S.of(context).add_exam,
                            contentText:"your exam added successfully ");
                      }
                    }),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
