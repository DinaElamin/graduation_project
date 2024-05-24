// import 'package:ablexa/features/manager/feature_add_teacher_page/data/models/get_all_materail_model/get_all-matrial_model.dart';
// import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_cubit.dart';
// import 'package:ablexa/features/manager/feature_add_teacher_page/logic/cubits/get_all_material_cubit/get_all_material_state.dart';
// import 'package:ablexa/features/manager/feature_garde_details_page/data/models/get_all_material_by_term_id_model/get_all_material_by_term_id_model.dart';
// import 'package:ablexa/features/manager/feature_garde_details_page/logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../core/theming/colors.dart';
// import '../../../../../core/theming/styles.dart';
// import '../../../../../generated/l10n.dart';
// import '../../logic/cubits/get_all_material_by_term_id_cubit/get_all_material_by_term_id_cubit.dart';
//
// class SemesterOneWidgetByTerm extends StatefulWidget {
//   const SemesterOneWidgetByTerm({Key? key, required this.semesterId, required this.semesterName}) : super(key: key);
//   final int semesterId;
//   final String semesterName;
//
//   @override
//   State<SemesterOneWidgetByTerm> createState() => _SemesterOneWidgetState();
// }
//
// class _SemesterOneWidgetState extends State<SemesterOneWidgetByTerm> {
//   List<String> selectedSubjects = []; // Track selected subjects
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch data from the Cubit when the widget is first created
//     context.read<GetAllMaterialByTermIdCubit>().emitGetAllMaterialByTermIdStates(termId: widget.semesterId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: BlocBuilder<GetAllMaterialByTermIdCubit, GetAllMaterialByTermIdState>(
//         builder: (context, state) {
//           return state.when(
//             success: (data) {
//               List<GetAllMaterialByTermIdModel> getAllMaterialModel = data;
//               return
//             },
//             loading: () => const CircularProgressIndicator(),
//             error: (error) => Text('Error: $error'),
//             initial: () => const CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
