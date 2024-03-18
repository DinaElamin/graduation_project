import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';

class AddGradePage extends StatelessWidget {
  const AddGradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text(S.of(context).add_grade),
      elevation: 0,
      backgroundColor: ColorsManager.mainWhite,
      foregroundColor: ColorsManager.mainBlack,
    ),
      body: ListView(children: [
        Column(children: [],)
      ]),

    );
  }
}
