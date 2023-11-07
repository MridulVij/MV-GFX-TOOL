import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'domain/colors/colors.dart';
import 'domain/provider_logics/auto_gfx/manual_gfx_provider.dart';
import 'domain/routes/route.dart';
import 'domain/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/auth/google_sign_in_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => GoogleSignInProvider()),
        ),
      ],
      child: MaterialApp(
        title: "MV TOOL",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
              primary: Colors.green, secondary: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: CustomColors.otherColor,
            elevation: 0.0,
            titleSpacing: 0.0,
            titleTextStyle:
                TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            iconTheme: IconThemeData(color: CustomColors.primaryColor),
          ),
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
