import 'package:fluttertoast/fluttertoast.dart';

import '../colors/colors.dart';

class Utils {
  static void showToastMsg(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: CustomColors.otherColor,
        textColor: CustomColors.blackColor,
        fontSize: 15.0);
  }
}
