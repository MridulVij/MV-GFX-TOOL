import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mv_tool/presentation/screens/senstivites/senstivities.dart';

import '../../../domain/routes/route.dart';

class SplashUI extends StatefulWidget {
  const SplashUI({super.key});

  @override
  State<SplashUI> createState() => _SplashUIState();
}

class _SplashUIState extends State<SplashUI>
    with SingleTickerProviderStateMixin {
  bool yes = false;
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds and then navigate to the home screen

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacementNamed(context, RouteNames.authverifier);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // appBar: AppBar(),
        body: Center(
      child: Image.asset(
        'assets/images/splash.gif',
        width: 200,
        height: 200,
      ),
    ));
  }
}
