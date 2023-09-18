import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import '../../domain/colors/colors.dart';
import '../components/custom_autotext.dart';
import '../components/custom_button.dart';
import 'google_sign_in_provider.dart';

class SignInUI extends StatefulWidget {
  const SignInUI({super.key});
  @override
  State<SignInUI> createState() => _SignInUIState();
}

class _SignInUIState extends State<SignInUI> {
  bool _isLoading = false;
  // with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   // Wait for 2 seconds and then navigate to the home screen
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  //   Future.delayed(const Duration(milliseconds: 2000), () {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   });
  // }

  // @override
  // void dispose() {
  //   SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //       overlays: SystemUiOverlay.values);
  //   super.dispose();
  // }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "MV GFX TOOL",
                    fontSize: 50,
                    color: CustomColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  AutoSizeText(
                    "Powerful & Advance GFX Tool!",
                    fontSize: 22,
                    color: CustomColors.blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 280,
                  // width: 200,
                  child: Image(
                    image: AssetImage(
                      'assets/images/splash_logo.png',
                    ),
                  ),
                ),
              ],
            ),
            const Image(
              image: AssetImage('assets/icons/gears.gif'),
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: _isLoading == true
                            ? const CircularProgressIndicator(
                                strokeWidth: 6,
                              )
                            : const SizedBox(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: CustomButton(
                          onSubTitle: false,
                          titleSize: 15,
                          height: 50,
                          // width: 250,
                          borderRadius: 10,
                          btnClr: Colors.white,
                          content: 'assets/icons/googlepng.svg',
                          contentColor: Colors.transparent,
                          onPress: () {
                            setState(() {
                              _isLoading = true;
                            });
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                          title: 'Sign in with Google',
                          titleClr: Colors.black,
                        ),
                      ),
                      const Text(
                        '100% Safe & Secure!',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Text(
                            'MADE IN ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SvgPicture.asset(
                            'assets/icons/indiaflag.svg',
                            height: 15,
                          ),
                          const Text(
                            ' WITH ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          SvgPicture.asset(
                            'assets/icons/heart.svg',
                            height: 15,
                          ),
                        ],
                      ),
                      AutoSizeText("HandCrafted By MVISMAD")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
