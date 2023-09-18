import 'package:flutter/material.dart';

class SnackBarMessage {
  static showSnackBarMessage(
      BuildContext context, String msg, bool functionCorrect) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //   content: Text(
    //     msg,
    //     style: TextStyle(fontSize: 15, color: CustomColors.otherColor),
    //   ),
    //   backgroundColor:
    //       (functionCorrect == true) ? CustomColors.primaryColor : Colors.red,
    //   shape: ContinuousRectangleBorder(
    //       // borderRadius: BorderRadius.circular(100),
    //       side: BorderSide(width: 1, color: CustomColors.otherColor)),
    //   // action: SnackBarAction(
    //   //   label: 'Undo',
    //   //   onPressed: () {
    //   //     // Some code to undo the change.
    //   //   },
    //   // ),
    // )
    // );

    //
    void showSnackbar(BuildContext context) {
      final snackbar = SnackBar(content: Text('Hello, Snackbar!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
