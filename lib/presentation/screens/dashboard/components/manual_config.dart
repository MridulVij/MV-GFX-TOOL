import 'package:flutter/material.dart';
import '../../../../domain/colors/colors.dart';
import '../../../../domain/paths/game_paths_directory.dart';
import '../../../../domain/plugins/file_mover.dart';
import '../../../components/custom_new_button.dart';

class ManualConfigUI extends StatefulWidget {
  const ManualConfigUI({super.key});

  @override
  State<ManualConfigUI> createState() => _ManualConfigUIState();
}

class _ManualConfigUIState extends State<ManualConfigUI> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final String userCustomSelectedMsg = "UserCustom.ini file is Selected!";
  final String activeSavFileSelectedMsg = "Active.sav file is Selected!";
  final String notappliedMsg = "Wrong File Selected! Please Select Again!";
  final String manualSettingsSaved = "Manual Configs Applied Successfully!";
  final String nothingSelected =
      "You Have Not Select Any File! Please Select Again!";
  bool isUserCustomSelected = false;
  bool isActiveSavSelected = false;
  final String manualSettingsNotSavedBecauseNoFileSelected =
      "Please Select Both Manual Files to Apply Config!";
  final String pathAccessException =
      "Android 11, 12, 13 Permissions is not allowed to paste file inside Android/data folders - Permission Restricted by Android!";
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text(
          "Manual GFX",
          style: TextStyle(fontFamily: "Fonts", color: CustomColors.blackColor),
        ),
        // backgroundColor: CustomColors.primaryColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: CustomColors.darkGreyColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Your - UserCustom.ini",
                              style: TextStyle(
                                  color: CustomColors.blackColor,
                                  fontSize: 20,
                                  fontFamily: "Fonts",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Apply Custom Resolution Graphic Config",
                              style: TextStyle(
                                color: CustomColors.darkGreyColor,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Fonts",
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // widget
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Ink(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: CustomColors.greyColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () async {
                              String shouldShowSnackbar =
                                  await FileMover.pickFileAndSave(
                                      GamePathsDirectory.internalStoragePath +
                                          GamePathsDirectory.bgmi +
                                          GamePathsDirectory.userCustomIni,
                                      "ini");
                              print(shouldShowSnackbar);
                              if (shouldShowSnackbar == "1") {
                                showSnackbar(
                                    context, userCustomSelectedMsg, true);
                                isUserCustomSelected = true;
                              } else if (shouldShowSnackbar == "0") {
                                showSnackbar(context, notappliedMsg, false);
                                isUserCustomSelected = false;
                              } else if (shouldShowSnackbar == "3") {
                                // android 12 , 13 permissions is not allowed to paste file inside Android/data folders
                                showSnackbar(
                                    context,
                                    "This Feature for Android 10 and Below Users!",
                                    false);
                                showSnackbar(
                                    context, pathAccessException, false);
                                showSnackbar(
                                    context,
                                    "Error will be Fixed on 1.1 Update of MV GFX TOOL we will working on it!",
                                    false);
                                showSnackbar(
                                    context,
                                    "Wait for New 1.1 Update else Degrade Your Device!",
                                    false);
                              } else {
                                showSnackbar(context, nothingSelected, false);
                                isUserCustomSelected = false;
                              }
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Center(
                                child: Text(
                              "+ ADD",
                              style:
                                  TextStyle(color: CustomColors.primaryColor),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              // widget
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: CustomColors.darkGreyColor)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Select Your - Active.sav",
                              style: TextStyle(
                                  color: CustomColors.blackColor,
                                  fontSize: 20,
                                  fontFamily: "Fonts",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Apply Custom FPS Graphics Config",
                              style: TextStyle(
                                color: CustomColors.darkGreyColor,
                                fontWeight: FontWeight.w200,
                                fontFamily: "Fonts",
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // widget
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Ink(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: CustomColors.greyColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: InkWell(
                            onTap: () async {
                              String shouldShowSnackbar =
                                  await FileMover.pickFileAndSave(
                                      GamePathsDirectory.internalStoragePath +
                                          GamePathsDirectory.bgmi +
                                          GamePathsDirectory.userCustomIni,
                                      "sav");
                              print(shouldShowSnackbar);
                              if (shouldShowSnackbar == "1") {
                                showSnackbar(
                                    context, activeSavFileSelectedMsg, true);
                                isActiveSavSelected = true;
                              } else if (shouldShowSnackbar == "0") {
                                showSnackbar(context, notappliedMsg, false);
                                isActiveSavSelected = false;
                              } else if (shouldShowSnackbar == "3") {
                                // android 12 , 13 permissions is not allowed to paste file inside Android/data folders
                                showSnackbar(
                                    context, pathAccessException, false);
                              } else {
                                showSnackbar(context, nothingSelected, false);
                                isActiveSavSelected = false;
                              }
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: const Center(
                                child: Text(
                              "+ ADD",
                              style:
                                  TextStyle(color: CustomColors.primaryColor),
                            )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomNewButton(
                  title: "SAVE SETTINGS!",
                  onTap: () {
                    // ads waale time me async await lga lena
                    (isUserCustomSelected == true &&
                            isActiveSavSelected == true)
                        ? showSnackbar(context, manualSettingsSaved, true)
                        : showSnackbar(context,
                            manualSettingsNotSavedBecauseNoFileSelected, false);
                  },
                  btnColor: CustomColors.primaryColor,
                  titleColor: CustomColors.otherColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackbar(
      BuildContext context, String msg, bool functionCorrect) async {
    final snackbar = SnackBar(
      duration: const Duration(milliseconds: 2000),
      content: Text(
        msg,
        style: const TextStyle(fontSize: 15, color: CustomColors.otherColor),
      ),
      backgroundColor:
          (functionCorrect == true) ? CustomColors.primaryColor : Colors.red,
      shape: const ContinuousRectangleBorder(
          // borderRadius: BorderRadius.circular(100),
          side: BorderSide(width: 1, color: CustomColors.otherColor)),
      // action: SnackBarAction(
      //   label: 'Undo',
      //   onPressed: () {
      //     // Some code to undo the change.
      //   },
      // ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
