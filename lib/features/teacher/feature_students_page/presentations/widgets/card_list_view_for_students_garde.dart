import 'package:ablexa/core/helper/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/search_text_form_field.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../../manager/feature_get_all_student_by_id_page/data/model/get_all_student_by_id_model/get_all_student_by_id_model.dart';
import '../../../../manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_cubit.dart';
import '../../../../manager/feature_get_all_student_by_id_page/logic/get_all_students_by_class_id_cubit/get_all_students_by_class_id_state.dart';
import 'card_information_grade_student.dart';

class GradeStudents extends StatefulWidget {
  const GradeStudents(
      {Key? key,
      required this.gradeName,
      required this.classId,
  required this.roleName, required this.teacherId});
  final String gradeName,roleName,teacherId;
  final int classId;

  @override
  State<GradeStudents> createState() => _GradeStudentsState();
}

class _GradeStudentsState extends State<GradeStudents> {
  final TextEditingController _searchController = TextEditingController();
  List<GetAllStudentsByClassIdModel> _searchedStudents = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.9, // Set a percentage of the screen height
      child: BlocBuilder<GetAllStudentByClassIdCubit,
          GetAllStudentsByClassIdState>(
        builder: (context, state) {
          return state.when(initial: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            );
          }, success: (data) {
            final List<GetAllStudentsByClassIdModel>
                getAllStudentsByClassIdModel = data;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SearchTextFormField(
                    validator: (value) {
                      // Your validation logic here
                      return null; // Return null for valid input
                    },
                    controller: _searchController,
                    contentPadding: const EdgeInsets.all(0),
                    fillColorFromBackground: ColorsManager.mainWhite,
                    borderRadius: 16.sp,
                    prefixIcon: const Icon(Icons.search),
                    onChange: (value) {
                      setState(() {
                        _searchedStudents = getAllStudentsByClassIdModel
                            .where((student) => student.name!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                    hintText: S.of(context).search,
                  ),
                ),
                Expanded(
                    child: _searchedStudents.isEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: getAllStudentsByClassIdModel.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: CardInformationGradeStudents(
                                teacherId: widget.teacherId,
                                roleName:widget.roleName,

                                email: getAllStudentsByClassIdModel[index]
                                    .email
                                    .toString(),
                                classId: widget.classId,
                                nationalIdStudent: "201236521452002",
                                type: widget.gradeName,
                                image: getAllStudentsByClassIdModel[index]
                                    .image
                                    .toString(),
                                name: getAllStudentsByClassIdModel[index]
                                    .name
                                    .toString(),
                              ),
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: _searchedStudents.length,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(top: 10.h),
                              child: CardInformationGradeStudents(
                                teacherId: widget.teacherId,
                                roleName:widget.roleName,

                                email: getAllStudentsByClassIdModel[index]
                                    .email
                                    .toString(),
                                classId: 1,
                                nationalIdStudent: "201236521452002",
                                type: widget.gradeName,
                                image:
                                    _searchedStudents[index].image.toString(),
                                name: _searchedStudents[index].name.toString(),
                              ),
                            ),
                          )),
              ],
            );
          }, error: (error) {
            return setupErrorState(context, error);
          });
        },
      ),
    );
  }

  setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
          error,
          style: TextStyles.font14MediumLightBlack,
        ),
        actions: [
          TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text(
                'Got It ',
                style: TextStyles.font20BoldBlack,
              )),
        ],
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
      ),
    );
  }
}
