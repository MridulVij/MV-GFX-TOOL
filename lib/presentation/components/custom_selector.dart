import 'package:flutter/material.dart';

import '../../domain/colors/colors.dart';

class CustomSelector extends StatefulWidget {
  final bool forwardIcon;
  final bool backwardIcon;
  final bool centerText;
  final String titleText;
  final VoidCallback onPress;
  final bool isSquareShapeButton;
  final bool isSelected;

  const CustomSelector({
    super.key,
    required this.forwardIcon,
    required this.backwardIcon,
    required this.centerText,
    required this.titleText,
    required this.onPress,
    required this.isSquareShapeButton,
    required this.isSelected,
  });

  @override
  State<CustomSelector> createState() => _CustomSelectorState();
}

class _CustomSelectorState extends State<CustomSelector> {
  // bool _isPressed = false;

  // void _handleTap() {
  //   setState(() {
  //     _isPressed = !_isPressed;
  //   });

  //   if (widget.onPress != null) {
  //     widget.onPress();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        widget.isSelected ? CustomColors.primaryColor : CustomColors.otherColor;
    Color textColor =
        widget.isSelected ? CustomColors.otherColor : CustomColors.primaryColor;
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        // animation of button is pending
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.29,

        decoration: BoxDecoration(
            color: buttonColor,
            boxShadow: const [
              BoxShadow(
                color: CustomColors.greyColor,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
            borderRadius: widget.isSquareShapeButton == true
                ? BorderRadius.circular(10)
                : BorderRadius.circular(30),
            border: Border.all(width: 1, color: CustomColors.primaryColor)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          widget.backwardIcon == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 16,
                    color: textColor,
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: widget.centerText == false
                ? const EdgeInsets.fromLTRB(0, 0, 10, 0)
                : const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(' ${widget.titleText} ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ),
          widget.forwardIcon == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 16,
                    color: textColor,
                  ),
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}
