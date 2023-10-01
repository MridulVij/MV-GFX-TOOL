import 'package:flutter/material.dart';
import 'package:mv_tool/domain/colors/colors.dart';

class FrontCard extends StatelessWidget {
  final String imageUrl;
  final String contributerName;
  final Function()? onClick;
  const FrontCard(
      {super.key,
      required this.imageUrl,
      required this.contributerName,
      this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(6),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: CustomColors.darkGreyColor)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("open detail screen");
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageUrl),
              ),
            ),
            Divider(
              color: CustomColors.greyColor,
            ),
            GestureDetector(
              onTap: () {
                print("liked senstivity");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      Text("100K"),
                    ],
                  ),
                  Text('Contributer: $contributerName')
                ],
              ),
            ),
          ],
        ));
  }
}
