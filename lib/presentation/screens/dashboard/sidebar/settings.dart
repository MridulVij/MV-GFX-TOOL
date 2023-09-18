import 'package:flutter/material.dart';

import '../../../../domain/colors/colors.dart';
import '../../../../domain/plugins/toast_message.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 5,
        title: const Text("Tool Settings",
            style: TextStyle(
                fontFamily: 'Fonts',
                fontSize: 20,
                color: CustomColors.blackColor,
                fontWeight: FontWeight.w500)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Divider(
            //   endIndent: 10,
            //   indent: 10,
            // ),
            ListTile(
              onTap: () {
                Utils.showToastMsg('Feature Available in 1.1 Update!');
              },
              title: const Text("Select Theme"),
              subtitle: const Text(
                "Change Your Tool Theme - Dark/Light.",
                style: TextStyle(color: CustomColors.darkGreyColor),
              ),
              leading: const Icon(Icons.dark_mode),
            ),
            // Divider(
            //   endIndent: 10,
            //   indent: 10,
            // ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Reset Tool"),
                subtitle: Text(
                  "Reset GFX Tool Settings to Default Settings.",
                  style: TextStyle(color: CustomColors.darkGreyColor),
                ),
                leading: Icon(Icons.settings_suggest_sharp),
              ),
            ),
            // Divider(
            //   endIndent: 10,
            //   indent: 10,
            // ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("Clear Cache"),
                subtitle: Text(
                  "Delete All Downloaded & Old Files from GFX Tool.",
                  style: TextStyle(color: CustomColors.darkGreyColor),
                ),
                leading: Icon(Icons.delete_outline_sharp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
