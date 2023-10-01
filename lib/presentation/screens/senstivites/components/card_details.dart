import 'package:flutter/material.dart';
import 'package:mv_tool/domain/colors/colors.dart';

class CardDetails extends StatelessWidget {
  final String contributerName;
  const CardDetails({super.key, required this.contributerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Preview By: $contributerName',
            style: const TextStyle(
              fontSize: 17,
              color: CustomColors.blackColor,
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(children: [
            // Image.network
            Text("Get Senstivity Code")
          ]),
        ));
  }
}
