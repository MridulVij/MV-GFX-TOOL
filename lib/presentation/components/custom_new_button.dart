import 'package:flutter/material.dart';
import '../../domain/colors/colors.dart';

class CustomNewButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color btnColor;
  final Color titleColor;
  final String title;
  const CustomNewButton(
      {super.key,
      required this.onTap,
      required this.btnColor,
      required this.titleColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Ink(
        height: 50,
        decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(width: 1, color: CustomColors.greyColor),
            borderRadius: BorderRadius.circular(30)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(30),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: "Fonts",
                color: titleColor),
          )),
        ),
      ),
    );
  }
}
