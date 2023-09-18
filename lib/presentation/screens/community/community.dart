import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../domain/paths/social_media_links.dart';

class CommunityUI extends StatefulWidget {
  const CommunityUI({super.key});

  @override
  State<CommunityUI> createState() => _CommunityUIState();
}

class _CommunityUIState extends State<CommunityUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text('Community Chats!'),
                const Text("Feature Available in 1.1 Update!"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Till then Join Our Telegram.'),
                      IconButton(
                        onPressed: () {
                          Uri uri = Uri.parse(SocialMediaLinks.telegram);
                          launchUrl(uri,
                              mode: LaunchMode.externalNonBrowserApplication);
                        },
                        icon: SvgPicture.asset(
                          'assets/icons/tele.svg',
                          height: 50,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )
      ]),
    );
  }
}
