import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../domain/colors/colors.dart';
import '../../../domain/paths/game_paths_directory.dart';
import '../../../domain/routes/route.dart';
import '../../components/custom_button.dart';
import '../../components/custom_new_button.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import '../../components/custom_selector.dart';

//
// const gfxToolDir = "Android/data/com.example.mvismad_gfx_tool";
// const bgmiDir = "Android/data/com.pubg.imobile";

//

enum GameVersion { none, pubgLITE, pubgVT, pubgKR, pubgTW, pubgGL, bgmi }

class DashBoardUI extends StatefulWidget {
  const DashBoardUI({super.key});

  @override
  State<DashBoardUI> createState() => _DashBoardUIState();
}

class _DashBoardUIState extends State<DashBoardUI> {
  // late Saf safGfx;
  // late Saf safGame;
  int _index = 0;
  GamePathsDirectory gamePathsDirectory = GamePathsDirectory();
  String selectedOption = 'Option 1';

  // bool _isBgmi = false;
  // bool _isPubgGlobal = false;
  // bool _isPubgVietnam = false;
  // bool _isPubgKorea = false;
  // bool _isPubgTaiwan = false;
  // bool _isPubgLite = false;
  bool _antireset = false;
  var gameVersion = GameVersion.pubgGL;

  @override
  void initState() {
    // safGfx = Saf(gfxToolDir);
    // safGame = Saf(bgmiDir);
    super.initState();
    allowStoragePermission();
    dialogBox();
  }

  void dialogBox() {
    SharedPreferences.getInstance().then((prefs) {
      bool understood = false; // prefs.getBool('understood') ?? false;

      if (!understood) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: SizedBox(
                height: 300,
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.cente,
                  children: [
                    const Text("Select Game Version V2.7",
                        style: TextStyle(
                            // fontFamily: "Fonts",
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontFamily: "Fonts",
                            fontWeight: FontWeight.w500)),
                    const Text("That is Currently Installed in Your Device!",
                        style: TextStyle(
                            // fontFamily: "Fonts",
                            color: CustomColors.darkGreyColor,
                            fontSize: 10,
                            fontFamily: "Fonts",
                            fontWeight: FontWeight.w500)),
                    //

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.bgmi,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.bgmi;
                              });
                            },
                            titleText: "BGMI",
                          ),
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.pubgGL,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.pubgGL;
                              });
                            },
                            titleText: "PUBG GL",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.pubgTW,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.pubgTW;
                              });
                            },
                            titleText: "PUBG TW",
                          ),
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.pubgKR,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.pubgKR;
                              });
                            },
                            titleText: "PUBG KR",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.pubgVT,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.pubgVT;
                              });
                            },
                            titleText: "PUBG VT",
                          ),
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: gameVersion == GameVersion.pubgLITE,
                            onPress: () {
                              setState(() {
                                gameVersion = GameVersion.pubgLITE;
                              });
                            },
                            titleText: "PUBG LITE",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                CustomColors.primaryColor)),
                        onPressed: () {
                          prefs.setBool('understood', true);
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Selected!",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }

  void allowStoragePermission() async {
    // const bgmiDir = "Android/data/com.pubg.imobile";

    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  void setSelectedOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: CustomColors.darkGreyColor)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Device Configuration",
                            style: TextStyle(
                                // fontFamily: "Fonts",
                                color: CustomColors.blackColor,
                                fontSize: 15,
                                fontFamily: "Fonts",
                                fontWeight: FontWeight.w500)),
                        Text("Shows Real-Time Device Hardware Info!",
                            style: TextStyle(
                                // fontFamily: "Fonts",
                                color: CustomColors.darkGreyColor,
                                fontSize: 10,
                                fontFamily: "Fonts",
                                fontWeight: FontWeight.w500)),
                        //
                      ],
                    ),
                  ),
                ),
              ),

              // game version code
              //
              //

              SizedBox(
                height: 200, // card height
                child: PageView.builder(
                  itemCount: 5,
                  controller: PageController(viewportFraction: 0.93),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: 0.98,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              'https://wallpapers.com/images/hd/awesome-pubg-game-cover-hd-lsmq43oghjmfskd2.webp')),
                    );
// -Why-Google-and-Apple-removed-BGMI-from-their-respective-app-stores-2-years-after-PUBG-ban-2.jpg
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: CustomColors.darkGreyColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "GFX Mode",
                                  style: TextStyle(
                                      // fontFamily: "Fonts",
                                      color: CustomColors.blackColor,
                                      fontSize: 15,
                                      fontFamily: "Fonts",
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("Select Your Applying Mode!",
                                    style: TextStyle(
                                        // fontFamily: "Fonts",
                                        color: CustomColors.darkGreyColor,
                                        fontSize: 10,
                                        fontFamily: "Fonts",
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            CustomButton(
                                small: true,
                                onSubTitle: true,
                                subTitle: "Reset All Configs",
                                subTitleClr: CustomColors.otherColor,
                                subTitleSize: 9,
                                titleSize: 12,
                                contentColor: CustomColors.otherColor,
                                borderRadius: 30,
                                height: 40,
                                // width: 160,
                                content: Icons.delete,
                                onPress: () {
                                  // Navigator.pushNamed(
                                  //     context, RoutesName.manualConfig);
                                },
                                title: "RESET CONFIG",
                                titleClr: Colors.white,
                                btnClr: Colors.blue),
                          ],
                        ),
                      ),
                      //
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                                small: false,
                                onSubTitle: true,
                                titleSize: 17,
                                borderRadius: 25,
                                height: 70,
                                // width: 160,
                                content: Icons.bolt_sharp,
                                contentColor: CustomColors.otherColor,
                                onPress: () async {
                                  // await safGfx.getDirectoryPermission(
                                  //     isDynamic: true,
                                  //     grantWritePermission: true);
                                  // await safGame.getDirectoryPermission(
                                  //     isDynamic: true,
                                  //     grantWritePermission: true);
                                  // _showAlertDialog(
                                  //     context); // this will only show when the game version is not selected by user else direct go to next screen!
                                  Navigator.pushNamed(
                                      context, RouteNames.autoConfig);
                                  // await saf.getDirectoryPermission(
                                  //     isDynamic: true,
                                  //     grantWritePermission: true);
                                },
                                title: "AUTO GFX",
                                subTitle: "Apply Settings Fastly!",
                                subTitleClr: CustomColors.otherColor,
                                subTitleSize: 8.5,
                                titleClr: Colors.white,
                                btnClr: CustomColors.primaryColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomButton(
                                small: false,
                                onSubTitle: true,
                                titleSize: 17,
                                contentColor: CustomColors.otherColor,
                                borderRadius: 25,
                                height: 70,
                                // width: 160,
                                content: Icons.settings,
                                onPress: () {
                                  Navigator.pushNamed(
                                      context, RouteNames.manualConfig);
                                },
                                title: "MANUAL GFX",
                                subTitle: "Apply Your Own Files",
                                subTitleClr: CustomColors.otherColor,
                                subTitleSize: 8.5,
                                titleClr: CustomColors.otherColor,
                                btnClr: CustomColors.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    // height: 150,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            width: 1, color: CustomColors.darkGreyColor)),
                    child: Column(
                      children: [
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "AntiReset Mode",
                                    style: TextStyle(
                                        // fontFamily: "Fonts",
                                        color: CustomColors.blackColor,
                                        fontSize: 15,
                                        fontFamily: "Fonts",
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                      "Applied Files can't be Reset!\nJust Click 'RUN GAME' To Play Instantly!",
                                      style: TextStyle(
                                          // fontFamily: "Fonts",
                                          color: CustomColors.darkGreyColor,
                                          fontSize: 10,
                                          fontFamily: "Fonts",
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                              child: Switch(
                                value: _antireset,
                                onChanged: (newValue) {
                                  setState(() {
                                    _antireset = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                  small: false,
                                  onSubTitle: true,
                                  subTitle: "Clear Game Cache",
                                  subTitleClr: CustomColors.otherColor,
                                  subTitleSize: 10,
                                  titleSize: 15,
                                  contentColor: CustomColors.otherColor,
                                  borderRadius: 30,
                                  height: 50,
                                  // width: 160,
                                  content: Icons.build_circle_rounded,
                                  onPress: () {
                                    // Navigator.pushNamed(
                                    //     context, RoutesName.manualConfig);
                                  },
                                  title: "CLEAR CACHE!",
                                  titleClr: Colors.white,
                                  btnClr: Colors.blue),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CustomButton(
                                  small: false,
                                  onSubTitle: true,
                                  subTitle: "Clear Game Data",
                                  subTitleClr: CustomColors.otherColor,
                                  subTitleSize: 10,
                                  titleSize: 15,
                                  contentColor: CustomColors.otherColor,
                                  borderRadius: 30,
                                  height: 50,
                                  // width: 160,
                                  content: Icons.delete_forever_rounded,
                                  onPress: () {
                                    // Navigator.pushNamed(
                                    //     context, RoutesName.manualConfig);
                                  },
                                  title: "CLEAR DATA!",
                                  titleClr: Colors.white,
                                  btnClr: Colors.red),
                            ),
                          ],
                        ),
                        CustomNewButton(
                          btnColor: CustomColors.primaryColor,
                          onTap: () async {
                            await LaunchApp.openApp(
                                openStore: false,
                                androidPackageName: GameRunPaths.bgmi);
                          },
                          title: "RUN GAME",
                          titleColor: CustomColors.otherColor,
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
