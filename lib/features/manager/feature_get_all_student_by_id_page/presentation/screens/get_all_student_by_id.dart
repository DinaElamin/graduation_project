import '../../../../../core/theming/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/get_all_students_by_id_list_view.dart';

class GetAllStudentById extends StatelessWidget {
  const GetAllStudentById({super.key, required this.classId});
  final int classId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.moreLightGrey,
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).students),
          GetAllStudentByIdListView(classId: classId),
        ],
      ),
    );
  }
}
