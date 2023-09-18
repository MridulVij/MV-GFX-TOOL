// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mv_tool/domain/colors/colors.dart';

class AutoScrollingImages extends StatelessWidget {
  final List<String> imageUrls;
  VoidCallback imageClick;

  AutoScrollingImages({
    Key? key,
    required this.imageUrls,
    required this.imageClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: CustomColors.primaryColor,
            onTap: imageClick,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrls[index],
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  // width // Adjust the image width as needed
                  // height: 100, // Adjust the image height as needed
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
