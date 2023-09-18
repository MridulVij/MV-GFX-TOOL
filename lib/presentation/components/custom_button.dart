// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_autotext.dart';

// button is not workings
class CustomButton extends StatelessWidget {
  final VoidCallback onPress;

  final String title;
  final String image = "";
  final Color btnClr;
  final Color titleClr;
  final double borderRadius;
  final double height;
  // final double width;
  final dynamic content;
  final Color contentColor;
  final double titleSize;
  String? subTitle;
  Color? subTitleClr;
  double? subTitleSize;
  final bool onSubTitle;
  CustomButton({
    Key? key,
    required this.onPress,
    required this.title,
    this.btnClr = Colors.transparent,
    required this.titleClr,
    required this.borderRadius,
    required this.height,
    this.content,
    required this.contentColor,
    required this.titleSize,
    this.subTitle,
    this.subTitleClr,
    this.subTitleSize,
    required this.onSubTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: height,
      width: MediaQuery.sizeOf(context).width * 0.4,
      decoration: BoxDecoration(
        color: btnClr, // Use the custom button color
        border: Border.all(
          width: 1,
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
      ),
      child:
          // Wrap the content with Material to enable splash ink effect

          InkWell(
        onTap: onPress,
        splashColor: const Color.fromARGB(217, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (content is String)
              SvgPicture.asset(
                content,
                height: 30,
              )
            else if (content is IconData)
              Icon(
                content,
                color: contentColor,
              ),
            const SizedBox(width: 4) // Add some space between image and text
            ,
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(title,
                    fontSize: titleSize,
                    color: titleClr,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center),
                onSubTitle == true
                    ? AutoSizeText(subTitle!,
                        fontSize: subTitleSize ?? 0,
                        color: subTitleClr,
                        fontWeight: FontWeight.w300,
                        textAlign: TextAlign.center)
                    : SizedBox(),
              ],
            ),
            // Text(
            //   title,
            //   style: TextStyle(
            //     color: titleClr,
            //     fontFamily: "Fonts",
            //     fontSize: 20,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
