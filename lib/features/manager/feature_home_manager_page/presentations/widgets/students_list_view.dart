import 'package:ablexa/features/manager/feature_home_manager_page/presentations/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/search_text_form_field.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/get_all_student_model/get_all_student_model.dart';
import '../../logic/cubits/get_all_student_cubit/get_all_student_cubit/get_all_student_cubit.dart';
import '../../logic/cubits/get_all_student_cubit/get_all_student_cubit/get_all_student_state.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({Key? key, required this.token});
final String token;
  @override
  State<StudentsListView> createState() => _StudentsListViewState();
}

class _StudentsListViewState extends State<StudentsListView> {
  final TextEditingController _searchController = TextEditingController();
  List<GetAllStudentModel> _searchedStudents = [];

  @override
  void initState() {
    context.read<GetAllStudentDataCubit>().emitAllStudentStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllStudentDataCubit, GetAllStudentDataState>(
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
            final List<GetAllStudentModel> getAllStudentModel = data;

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
                        _searchedStudents = getAllStudentModel
                            .where((student) =>
                            student.name!
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                      });
                    }, hintText:  S.of(context).search,

                  ),
                ),
                Expanded(
                  child: _searchedStudents.isEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: getAllStudentModel.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StudentCard(
                        email: getAllStudentModel[index].email.toString(),
                        token: widget.token,
                        id: getAllStudentModel[index].id.toString(),
                        type: "Student",
                        image:
                        getAllStudentModel[index].image!.toString(),
                        name: getAllStudentModel[index].name.toString(),
                      ),
                    ),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchedStudents.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: StudentCard(
                        email: getAllStudentModel[index].email.toString(),
                        token: widget.token,
                        id: getAllStudentModel[index].id.toString(),
                        type: "Student",
                        image: _searchedStudents[index].image!.toString(),
                        name: _searchedStudents[index].name.toString(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error) {
            return AlertDialog(
              content: Text(
                error,
                style: TextStyles.font14MediumLightBlack,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Got It',
                    style: TextStyles.font20BoldBlack,
                  ),
                ),
              ],
              icon: Icon(
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
