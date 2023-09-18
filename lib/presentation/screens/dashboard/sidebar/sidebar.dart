import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../domain/colors/colors.dart';
import '../../../../domain/paths/social_media_links.dart';
import '../../../../domain/routes/route.dart';
import '../../../components/custom_autotext.dart';

class SideBarUI extends StatefulWidget {
  const SideBarUI({super.key});

  @override
  State<SideBarUI> createState() => _SideBarUIState();
}

class _SideBarUIState extends State<SideBarUI> {
  final userData = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "MV GFX TOOL - 1.0",
                  color: CustomColors.otherColor,
                  fontSize: 30,
                ),
                AutoSizeText(
                  'Game Version V2.7 Supported!',
                  color: CustomColors.otherColor,
                  fontSize: 15,
                ),
                AutoSizeText(
                  'MV GFX TOOL 1.1 Releasing Soon!',
                  color: CustomColors.otherColor,
                  fontSize: 15,
                ),
              ],
            ),
          ),

          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                userData!.photoURL!,
                height: 30,
                width: 30,
                fit: BoxFit.fill,
              ),
            ),
            title: AutoSizeText(
              "My Profile",
              fontSize: 15,
            ),
            onTap: () async {
              await Navigator.pushNamed(context, RoutesName.myprofile);

              // Navigator.pop(context);
            },
          ),

          // ListTile(
          //   leading: const Icon(Icons.rocket_launch),
          //   title: AutoSizeText(
          //     "Device Hardware Settings",
          //     fontSize: 15,
          //   ),
          //   onTap: () {
          //     Utils.showToastMsg('Feature Available in 1.1 Update!');
          //     Navigator.pop(context);
          //     // Add navigation logic for the Home option
          //     // Navigator.pushReplacement(context,
          //     //     MaterialPageRoute(builder: (context) => DashBoardUI()));
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(Icons.local_fire_department_rounded),
          //   title: AutoSizeText(
          //     "Advance Settings",
          //     fontSize: 15,
          //   ),
          //   onTap: () {
          //     Utils.showToastMsg('Feature Available in 1.1 Update!');
          //     Navigator.pop(context);
          //     // Add navigation logic for the Home option
          //     // Navigator.pushReplacement(context,
          //     //     MaterialPageRoute(builder: (context) => DashBoardUI()));
          //   },
          // ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: AutoSizeText(
              "Tool Settings",
              fontSize: 15,
            ),
            onTap: () async {
              await Navigator.pushNamed(context, RoutesName.settings);
              // Utils.showToastMsg('Feature Available in 1.1 Update!');
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.info_outline_rounded),
          //   title: AutoSizeText(
          //     "About Tool!",
          //     fontSize: 15,
          //   ),
          //   onTap: () async {
          //     await Navigator.pushNamed(context, RoutesName.settings);
          //     // Utils.showToastMsg('Feature Available in 1.1 Update!');
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: AutoSizeText(
              "Donate",
              fontSize: 15,
            ),
            onTap: () async {
              await Navigator.pushNamed(context, RoutesName.donate);
              // Utils.showToastMsg('Feature Available in 1.1 Update!');
            },
          ),
          // ListTile(
          //   leading: const Icon(
          //     Icons.logout_outlined,
          //     color: Colors.red,
          //   ),
          //   title: const Text('Sign Out',
          //       style:
          //           TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          //   onTap: () {
          //     // Add navigation logic for the Home option
          //     Navigator.pop(context);
          //     // to sign in screen
          //   },
          // ),
          const Divider(),
          ListTile(
            // leading: const Icon(Icons.mail_rounded),
            title: AutoSizeText(
              "Having Any Query, Problem?\nLet's Connect with MVISMAD",
              fontSize: 15,
            ),
            onTap: () {
              // Add navigation logic for the Home option
              Navigator.pop(context);
            },
          ),

          // Add more ListTile widgets for other sidebar options

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
          // SizedBox(height: 40),
          Image.asset(
            'assets/images/from_creatify_black.png',
          ),
          // const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                "Early Access Version - 1.0",
                color: CustomColors.darkGreyColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
