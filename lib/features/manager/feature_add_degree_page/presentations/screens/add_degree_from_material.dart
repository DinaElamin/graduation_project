import 'package:ablexa/core/theming/colors.dart';
import 'package:ablexa/core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../../core/shared_widgets/app_elevated_button.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../feature_garde_details_page/data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';
import '../../../feature_garde_details_page/logic/cubits/add_material_degree_cubit/add_material_degree_cubit.dart';
import '../../../feature_garde_details_page/logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_cubit.dart';
import '../../../feature_garde_details_page/logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_state.dart';

class AddDegreeFromMaterial extends StatefulWidget {
  const AddDegreeFromMaterial({
    Key? key,
    required this.gradeName,
    required this.token,
    required this.termId,
    required this.semesterName,
  }) : super(key: key);

  final String gradeName, token, semesterName;
  final int termId;

  @override
  _AddDegreeFromMaterialState createState() => _AddDegreeFromMaterialState();
}

class _AddDegreeFromMaterialState extends State<AddDegreeFromMaterial> {
  Map<int, String> enteredDegrees =
      {}; // Map to store entered degrees for each item

  @override
  void initState() {
    super.initState();
    // Fetch data from the Cubit when the widget is first created
    context
        .read<GetAllMaterialByTermIdCubit>()
        .emitGetAllMaterialByTermIdStates(termId: widget.termId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(
            pageName: widget.gradeName,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.semesterName,
                  style: TextStyles.font18SemiBoldBlack,
                ),
                verticalSpacing(10),
                BlocBuilder<GetAllMaterialByTermIdCubit,
                    GetAllMaterialByTermIdState>(
                  builder: (context, state) {
                    return state.when(
                      success: (data) {
                        List<GetAllMaterialByTermIdModel>
                            getAllMaterialByTermIdModel = data;
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      getAllMaterialByTermIdModel[index]
                                          .name
                                          .toString(),
                                      style: TextStyles.font16SemiBoldBlack,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showDialog<void>(
                                          context: context,
                                          builder:
                                              (BuildContext dialogContext) {
                                            final addMaterialGradeCubit =
                                                context.read<
                                                    AddMaterialGradeCubit>();
                                            return AlertDialog(
                                              title: const Text(
                                                'Enter Degree',
                                              ),
                                              content: TextField(
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: 'Degree'),
                                                onChanged: (value) {
                                                  setState(() {
                                                    enteredDegrees[index] =
                                                        value; // Store the entered degree for this item
                                                  });
                                                },
                                              ),
                                              actions: <Widget>[
                                                AppTextButton(
                                                    buttonHeight: 25.r,
                                                    buttonWidth: 60.r,
                                                    textButton: "Save",
                                                    onPressed: () {
                                                      addMaterialGradeCubit
                                                          .emitAddMaterialDegreeStates(
                                                        widget.token,
                                                        materialid:
                                                            getAllMaterialByTermIdModel[
                                                                    index]
                                                                .id,
                                                        M_grade: int.parse(
                                                            enteredDegrees[
                                                                    index] ??
                                                                ''), // Get the entered degree for this item from the map
                                                      );
                                                      Navigator.of(
                                                              dialogContext)
                                                          .pop();
                                                    }),
                                                verticalSpacing(10),
                                                AppTextButton(
                                                    buttonHeight: 25.r,
                                                    buttonWidth: 60.r,
                                                    textButton:
                                                        S.of(context).cancel,
                                                    onPressed: () {
                                                      Navigator.of(
                                                              dialogContext)
                                                          .pop();
                                                    }),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        enteredDegrees[index] ??
                                            'Enter degree', // Display the entered degree for this item, or 'Enter degree' if not entered yet
                                        style: TextStyles.font12RegularPurple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error) => Center(child: Text('Error: $error')),
                      initial: () =>
                          const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
