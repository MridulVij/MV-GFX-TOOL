import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../domain/colors/colors.dart';
import '../../../../domain/paths/social_media_links.dart';
import '../../../components/custom_autotext.dart';
import '../../../components/custom_button.dart';
import '../../../auth/google_sign_in_provider.dart';

class ProfileUI extends StatefulWidget {
  const ProfileUI({super.key});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  bool _isLoading = false;
  final userData = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 5,
          title: const Text("My Profile",
              style: TextStyle(
                  fontFamily: 'Fonts',
                  fontSize: 20,
                  color: CustomColors.blackColor,
                  fontWeight: FontWeight.w500)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(userData!.photoURL!)),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            userData!.displayName!,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.blackColor,
                          ),
                          AutoSizeText(
                            userData!.email!,
                            fontSize: 14,
                            color: CustomColors.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                const Divider(
                  color: CustomColors.greyColor,
                  endIndent: 40,
                  indent: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AutoSizeText(
                    "DATA PRIVACY NOTICE: This App Only Takes E-MAIL ID and UserName of User from Google Login Don't Worry Your Data is 100% Safe as a Indian Developer have Designed and Developed this App So, Please Keep Faith & Support Indian Developers for Adding More Advance Features and provide Feedback According on our Social Media Handles!",
                    color: CustomColors.darkGreyColor,
                    fontSize: 15,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  color: CustomColors.greyColor,
                  endIndent: 40,
                  indent: 40,
                ),
                //

                Column(
                  children: [
                    const Text("Follow Us On:",
                        style: TextStyle(
                            fontFamily: 'Fonts',
                            fontSize: 15,
                            color: CustomColors.blackColor)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            Uri uri = Uri.parse(SocialMediaLinks.youtube);
                            launchUrl(uri,
                                mode: LaunchMode.externalNonBrowserApplication);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/yt.svg',
                            height: 42,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Uri uri = Uri.parse(SocialMediaLinks.telegram);
                            launchUrl(uri,
                                mode: LaunchMode.externalNonBrowserApplication);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/tele.svg',
                            height: 45,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Uri uri = Uri.parse(SocialMediaLinks.facebook);
                            launchUrl(uri,
                                mode: LaunchMode.externalNonBrowserApplication);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/fb.svg',
                            height: 36,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Uri uri = Uri.parse(SocialMediaLinks.instagram);
                            launchUrl(uri,
                                mode: LaunchMode.externalNonBrowserApplication);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/ig.svg',
                            height: 42,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Uri uri = Uri.parse(SocialMediaLinks.threads);
                            launchUrl(uri,
                                mode: LaunchMode.externalNonBrowserApplication);
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/th.svg',
                            height: 42,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: CustomColors.greyColor,
                  endIndent: 40,
                  indent: 40,
                ),
                _isLoading == true
                    ? const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 6,
                        ),
                      )
                    : const SizedBox(),
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        onSubTitle: false,
                        titleSize: 18,
                        height: 50,
                        // width: 100,
                        borderRadius: 10,
                        btnClr: Colors.white,
                        content: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        contentColor: Colors.transparent,
                        onPress: () async {
                          // sign out
                          setState(() {
                            _isLoading = true;
                          });
                          final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false);
                          await provider.logOut();
                          Navigator.pop(context);
                        },
                        title: 'Sign Out',
                        titleClr: Colors.red,
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 40),
                Image.asset(
                  'assets/images/from_creatify_black.png',
                  color: CustomColors.blackColor,
                ),
                // const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'COPYRIGHT 2023 - MV GFX TOOL BY MVISMAD',
                      color: CustomColors.darkGreyColor,
                      fontSize: 10,
                    ),
                  ],
                ),

                // Text(userData!.emailVerified!), bool true or false
                // Text("userData!.phoneNumber ?? "Not Added!"),
              ],
            ),
          ),
        ));
  }
}
