import '../../../../core/theming/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../widgets/card_list_view_for_students_garde.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key, required this.gradeName});
  final String gradeName;

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  Widget _buildSearchField() {
    return TextField(
      style: TextStyles.font18SemiBoldBlack,
      controller: _searchController,
      maxLines: 2,
      cursorColor: ColorsManager.grey,
      decoration: InputDecoration(
        hintText: S.of(context).find_a_student,
        border: InputBorder.none,
        hintStyle: TextStyle(
            color: ColorsManager.mainBlack.withOpacity(0.5), fontSize: 18),
      ),
      onChanged: (searchTerm) {
        // addSearchedForItemsToSearchesList(searchTerm);
      },
    );
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: ColorsManager.mainBlack,
          ),
        )
      ];
    } else {
      return [
        IconButton(
          onPressed: () {
            _startSearching();
          },
          icon: const Icon(
            Icons.search,
            color: ColorsManager.mainBlack,
          ),
        )
      ];
    }
  }

  void _startSearching() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
    });
  }

  Widget buildAppBarTitle() {
    return Text(S.of(context).students, style: TextStyles.font18SemiBoldBlack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButton(
            color: ColorsManager.mainBlack,
          ),
          title: _isSearching ? _buildSearchField() : buildAppBarTitle(),
          actions: _buildAppBarActions(),
          backgroundColor: ColorsManager.mainWhite),
      backgroundColor: ColorsManager.grey,
      body: ListView(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpacing(10),
                  GradeStudents(gradeName: widget.gradeName),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
