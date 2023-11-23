import 'package:flutter/material.dart';

class SnackBarMessage {
  static showSnackBarMessage(
      BuildContext context, String msg, bool functionCorrect) {
    void showSnackbar(BuildContext context) {
      final snackbar = SnackBar(content: Text('Hello, Snackbar!'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
