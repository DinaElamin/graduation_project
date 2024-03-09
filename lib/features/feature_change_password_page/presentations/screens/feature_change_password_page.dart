import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      children: [
        Column(children: [

          Text(S.of(context).change_password),
        ]),
      ],
    ),);
  }
}
