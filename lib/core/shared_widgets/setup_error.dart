import 'package:flutter/material.dart';

import '../theming/styles.dart';
void setupErrorState(BuildContext context, String error) {
  Navigator.of(context).pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text(
        error,
        style: TextStyles.font14MediumLightBlack,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Got It ',
            style: TextStyles.font20BoldBlack,
          ),
        ),
      ],
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
    ),
  );
}