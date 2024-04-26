import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/search_text_form_field.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../data/models/get_all_teacher_model/get_all_teacher_model.dart';
import '../../logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_cubit.dart';
import '../../logic/cubits/get_all_teacher_cubit/login_cubit/get_all_teacher_state.dart';
import 'card_information.dart';

class TeachersListView extends StatefulWidget {
  const TeachersListView({Key? key, required this.token}) : super(key: key);
final String token;
  @override
  State<TeachersListView> createState() => _TeachersListViewState();
}

class _TeachersListViewState extends State<TeachersListView> {
  final TextEditingController _searchController = TextEditingController();
  List<GetAllTeacherModel> _searchedTeachers = [];

  @override
  void initState() {
    super.initState();
    context.read<GetAllTeacherDataCubit>().emitAllTeacherStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllTeacherDataCubit, GetAllTeacherDataState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            return const Center(child: CircularProgressIndicator(color: ColorsManager.mainColor));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator(color: ColorsManager.mainColor));
          },
          success: (data) {
            final List<GetAllTeacherModel> getAllTeacherModel = data;

            return Column(
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 10.r, bottom: 10.r),

                  child: SearchTextFormField(
                    controller: _searchController,
                    onChange: (value) {

                      // Check if getAllTeacherModel is not empty
                      if (getAllTeacherModel.isNotEmpty) {
                        _searchedTeachers = getAllTeacherModel.where((teacher) =>
                            teacher.name!.toLowerCase().contains(value.toLowerCase())).toList();
                      }

                      setState(() {}); // Update the UI to show the searched list
                    },
                    contentPadding: const EdgeInsets.all(0),
                    fillColorFromBackground: ColorsManager.mainWhite,
                    borderRadius: 16.sp,
                    prefixIcon: const Icon(Icons.search),
                    hintText: S.of(context).search,
                    validator: (value) {
                      // Your validation logic here
                      return null; // Return null for valid input
                    },
                  ),
                ),
                Expanded(
                  child: _searchedTeachers.isEmpty
                      ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: getAllTeacherModel.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CardInformation(
                        token: widget.token,
                        id: getAllTeacherModel[index].id.toString(),
                        type: "Teacher",
                        image: getAllTeacherModel[index].image!,
                        name: getAllTeacherModel[index].name.toString(),
                      ),
                    ),
                  )
                      : ListView.builder(
                    shrinkWrap: true,
                    itemCount: _searchedTeachers.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CardInformation(
                        token: widget.token,
                        id: getAllTeacherModel[index].id.toString(),
                        type: "Teacher",
                        image: _searchedTeachers[index].image!,
                        name: _searchedTeachers[index].name.toString(),
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
              icon: const Icon(
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
