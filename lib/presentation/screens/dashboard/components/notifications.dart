import 'package:flutter/material.dart';

import '../../../../../domain/colors/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        // add counter - notification counter that tell how much notification will be come and not seend by user
        title: const Text("Notifications",
            style: TextStyle(
                fontFamily: 'Fonts',
                fontSize: 20,
                color: CustomColors.blackColor,
                fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("No Notifications."),
            )
          ],
        ),
      ),
    );
  }
}
