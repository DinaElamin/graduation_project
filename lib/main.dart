import 'package:ablexa/core/shared_widgets/no_internet_widget.dart';
import 'package:flutter/material.dart';
import 'ablexa.dart';
import 'core/Routing/app_router.dart';
import 'core/di/dependacy_injection.dart';
 import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  setupGetIt();
  runApp(
       checkconnection());
}

class checkconnection extends StatelessWidget {
  const checkconnection({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data == ConnectivityResult.none) {
            return const NoInternetWidget();
          }
          return AplexaApp(appRouter: AppRouter());
        }
      ),
    );
  }
}
