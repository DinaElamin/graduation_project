import 'package:flutter/material.dart';
import 'ablexa.dart';
import 'core/Routing/app_router.dart';
import 'core/di/dependacy_injection.dart';

void main() {
  setupGetIt();
  runApp(
      AplexaApp(
        appRouter: AppRouter(),
      ),
  );
}
