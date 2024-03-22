import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';
class AppbarSearchWidget extends StatefulWidget {
  const AppbarSearchWidget({super.key});

  @override
  State<AppbarSearchWidget> createState() => _AppbarSearchWidgetState();
}

class _AppbarSearchWidgetState extends State<AppbarSearchWidget> {
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
    );
  }
}
