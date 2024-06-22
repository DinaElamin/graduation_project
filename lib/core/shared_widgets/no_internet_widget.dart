
import 'package:flutter/material.dart';

// import '../theming/styles.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Please Check Connection of Internet...",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/No connection-pana.png")
          ],
        ),
      ),
    );
  }
}
