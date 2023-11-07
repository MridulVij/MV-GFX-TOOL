import 'package:flutter/material.dart';
import 'package:mv_tool/domain/colors/colors.dart';

import 'card_details.dart';

class FrontCard extends StatelessWidget {
  final String imageUrl;
  final String contributerName;
  final String? sensi_code;
  final List<String>? list;
  final Function()? onClick;
  const FrontCard(
      {super.key,
      required this.imageUrl,
      required this.contributerName,
      this.onClick,
      required this.sensi_code,
      required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: CustomColors.darkGreyColor)),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("open detail screen");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CardDetails(
                              imgs: list,
                              sensiCode: sensi_code,
                              contributerName: contributerName,
                            )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageUrl),
              ),
            ),
            const Divider(
              color: CustomColors.greyColor,
            ),
            GestureDetector(
              onTap: () {
                print("liked sensitivity");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // spacedbetween
                children: [
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Icon(
                  //       Icons.favorite,
                  //       color: Colors.red,
                  //       size: 28,
                  //     ),
                  //     Text("100K"),
                  //   ],
                  // ),
                  Text('Contributer: $contributerName'),
                ],
              ),
            ),
          ],
        ));
  }
}
