import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/theming/styles.dart';
import '../../data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';
import '../../logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_cubit.dart';
import '../../logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_state.dart';
class SemesterOneSubjectListWidget extends StatefulWidget {
  const SemesterOneSubjectListWidget({
    Key? key,
    required this.token,
    required this.yearId,
    required this.semesterId,
  }) : super(key: key);

  final String token;
  final int yearId, semesterId;

  @override
  State<SemesterOneSubjectListWidget> createState() =>
      _SemesterOneSubjectListWidgetState();
}

class _SemesterOneSubjectListWidgetState
    extends State<SemesterOneSubjectListWidget> {
  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
setState(() {
  context
      .read<GetAllMaterialByTermIdCubit>()
      .emitGetAllMaterialByTermIdStates(termId: widget.semesterId);
});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMaterialByTermIdCubit, GetAllMaterialByTermIdState>(
      builder: (context, state) {
        return state.when(
          success: (data) {
            List<GetAllMaterialByTermIdModel> getAllMaterialByTermIdModel = data;
            return ListView.builder(
              itemCount: getAllMaterialByTermIdModel.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorsManager.lightGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getAllMaterialByTermIdModel[index].name.toString(),
                          style: TextStyles.font16SemiBoldBlack,
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error) => Center(child: Text('Error: $error')),
          initial: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}

