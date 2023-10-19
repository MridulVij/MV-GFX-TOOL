import 'package:flutter/material.dart';
import '../../../../domain/colors/colors.dart';
import '../../../components/custom_new_button.dart';
import '../../../components/custom_selector.dart';

enum AutoGFX {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  eleven,
  twelve
}

enum FPS { one, two, three, four, five, six }

enum SoundQuality { low, high, ultra }

class AutoConfigUI extends StatefulWidget {
  const AutoConfigUI({super.key});

  @override
  State<AutoConfigUI> createState() => _AutoConfigUIState();
}

class _AutoConfigUIState extends State<AutoConfigUI> {
  bool selectedButton = false;
  bool _ramBoost = false;
  bool _processorBoost = false;
  bool _overclockBoost = false;
  bool _textureOptimization = false;
  bool _gpuOptimization = false;
  @override
  Widget build(BuildContext context) {
    var autogfx = AutoGFX.one;
    var fps = FPS.four;
    var soundQuality = SoundQuality.high;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Auto GFX",
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Resolution",
                                style: TextStyle(
                                    color: CustomColors.blackColor,
                                    fontSize: 20,
                                    fontFamily: "Fonts",
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Adjust the Pixel Quality in Game",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // GestureDetector(
                            //   onTap: () {
                            //     setState(() {
                            //       selectedButton = true;
                            //     });
                            //   },
                            //   child: Chip(
                            //       label: const Text("144p"),
                            //       backgroundColor: selectedButton == true
                            //           ? Theme.of(context).primaryColor
                            //           : Theme.of(context)
                            //               .scaffoldBackgroundColor),
                            // ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.one,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.one;
                                });
                              },
                              titleText: "144p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.two,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.two;
                                });
                              },
                              titleText: "240p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.three,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.three;
                                });
                              },
                              titleText: "360p",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.four,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.four;
                                });
                              },
                              titleText: "480p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.five,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.five;
                                });
                              },
                              titleText: "540p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.six,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.six;
                                });
                              },
                              titleText: "620p",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.seven,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.seven;
                                });
                              },
                              titleText: "740p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.eight,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.eight;
                                });
                              },
                              titleText: "820p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.nine,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.nine;
                                });
                              },
                              titleText: "1080p",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Chip(,label: Text("144p"),backgroundColor: Theme.of(context).primaryColor,),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.ten,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.ten;
                                });
                              },
                              titleText: "1280p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.eleven,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.eleven;
                                });
                              },
                              titleText: "1440p",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: autogfx == AutoGFX.twelve,
                              onPress: () {
                                setState(() {
                                  autogfx = AutoGFX.twelve;
                                });
                              },
                              titleText: "2160p",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
              //
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Frame Rate Per Second",
                                style: TextStyle(
                                    color: CustomColors.blackColor,
                                    fontSize: 20,
                                    fontFamily: "Fonts",
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Adjust the Smoothness Level in Game",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.one,
                              onPress: () {
                                setState(() {
                                  fps = FPS.one;
                                });
                              },
                              titleText: "25 FPS",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.two,
                              onPress: () {
                                setState(() {
                                  fps = FPS.two;
                                });
                              },
                              titleText: "30 FPS",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.three,
                              onPress: () {
                                setState(() {
                                  fps = FPS.three;
                                });
                              },
                              titleText: "40 FPS",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.four,
                              onPress: () {
                                setState(() {
                                  fps = FPS.four;
                                });
                              },
                              titleText: "60 FPS",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.five,
                              onPress: () {
                                setState(() {
                                  fps = FPS.five;
                                });
                              },
                              titleText: "90 FPS",
                            ),
                            CustomSelector(
                              backwardIcon: false,
                              centerText: true,
                              forwardIcon: false,
                              isSquareShapeButton: false,
                              isSelected: fps == FPS.six,
                              onPress: () {
                                setState(() {
                                  fps = FPS.six;
                                });
                              },
                              titleText: "120 FPS",
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    )),
              ),
              //
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
                              "Sound Quality",
                              style: TextStyle(
                                  color: CustomColors.blackColor,
                                  fontSize: 20,
                                  fontFamily: "Fonts",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Adjust the Sound Quality Experience in Game",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: soundQuality == SoundQuality.low,
                            onPress: () {
                              setState(() {
                                soundQuality = SoundQuality.low;
                              });
                            },
                            titleText: "LOW",
                          ),
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: soundQuality == SoundQuality.high,
                            onPress: () {
                              setState(() {
                                soundQuality = SoundQuality.high;
                              });
                            },
                            titleText: "HIGH",
                          ),
                          CustomSelector(
                            backwardIcon: false,
                            centerText: true,
                            forwardIcon: false,
                            isSquareShapeButton: false,
                            isSelected: soundQuality == SoundQuality.ultra,
                            onPress: () {
                              setState(() {
                                soundQuality = SoundQuality.ultra;
                              });
                            },
                            titleText: "ULTRA",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              //
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
                              "Graphics Optimization",
                              style: TextStyle(
                                  color: CustomColors.blackColor,
                                  fontSize: 20,
                                  fontFamily: "Fonts",
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Customizable Graphics According to Mobile Device Performance",
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

                      //
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("RAM Boost",
                                        style: TextStyle(
                                            fontFamily: 'Fonts',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                    Text(
                                      "RAM Optimization in Game",
                                      style: TextStyle(
                                        color: CustomColors.darkGreyColor,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Fonts",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _ramBoost,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _ramBoost = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("PROCESSOR Boost",
                                        style: TextStyle(
                                            fontFamily: 'Fonts',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                    Text(
                                      "PROCESSOR Optimization in Game",
                                      style: TextStyle(
                                        color: CustomColors.darkGreyColor,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Fonts",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _processorBoost,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _processorBoost = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("OverClock Boost",
                                        style: TextStyle(
                                            fontFamily: 'Fonts',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                    Text(
                                      "Device Processor OverClock in Game",
                                      style: TextStyle(
                                        color: CustomColors.darkGreyColor,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Fonts",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _overclockBoost,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _overclockBoost = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Texture Optimization",
                                        style: TextStyle(
                                            fontFamily: 'Fonts',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                    Text(
                                      "Texture Optimization in Game",
                                      style: TextStyle(
                                        color: CustomColors.darkGreyColor,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Fonts",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _textureOptimization,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _textureOptimization = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("GPU Optimization",
                                        style: TextStyle(
                                            fontFamily: 'Fonts',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20)),
                                    Text(
                                      "GPU Optimization in Game",
                                      style: TextStyle(
                                        color: CustomColors.darkGreyColor,
                                        fontWeight: FontWeight.w200,
                                        fontFamily: "Fonts",
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: _gpuOptimization,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _gpuOptimization = newValue;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // more widgets
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomNewButton(
                  title: "SAVE SETTINGS!",
                  onTap: () {},
                  btnColor: CustomColors.primaryColor,
                  titleColor: CustomColors.otherColor,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
