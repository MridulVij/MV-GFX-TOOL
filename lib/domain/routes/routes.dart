import 'package:flutter/material.dart';
import 'package:mv_tool/presentation/screens/senstivites/sensi_details.dart';

import '../../presentation/auth/google_sign_in_provider.dart';
import '../../presentation/auth/sign_in.dart';
import '../../presentation/screens/dashboard/components/auto_config.dart';
import '../../presentation/screens/dashboard/components/manual_config.dart';
import '../../presentation/screens/dashboard/components/notifications.dart';
import '../../presentation/screens/dashboard/dashboard.dart';
import '../../presentation/screens/dashboard/sidebar/donate.dart';
import '../../presentation/screens/dashboard/sidebar/profile.dart';
import '../../presentation/screens/dashboard/sidebar/settings.dart';
import '../../presentation/screens/splash/splash.dart';
import 'route.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.linear;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (settings.name) {
          case RoutesName.authverifier:
            return const AuthVerifier();
          case RoutesName.dashboard:
            return const DashBoardUI();
          case RoutesName.autoConfig:
            return const AutoConfigUI();
          case RoutesName.splashScreen:
            return const SplashUI();
          case RoutesName.settings:
            return const Settings();
          case RoutesName.notifications:
            return const Notifications();
          case RoutesName.manualConfig:
            return const ManualConfigUI();
          case RoutesName.signInWithGoogle:
            return const SignInUI();
          case RoutesName.myprofile:
            return const ProfileUI();
          case RoutesName.donate:
            return const Donate();
          // case RoutesName.sensiDetails:
          // return const SensiDetails(sensiName: );
          default:
            return const Scaffold(
              body: Center(
                child: Text("No Routes Found"),
              ),
            );
        }
      },
    );
  }
}
