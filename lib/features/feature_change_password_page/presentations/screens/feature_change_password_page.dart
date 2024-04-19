import 'package:flutter/material.dart';
import '../../../../core/shared_widgets/appBar_widget.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widgets/text-form_filed_password.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key, required this.email});
final String email;
  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarWidget(pageName: S.of(context).change_password),
          Column(children: [
            verticalSpacing(100),

            verticalSpacing(50),
             TextFormFieldPassword(email: widget.email),

          ]),
        ],
      ),
    );
  }
}
