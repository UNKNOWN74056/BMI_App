import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class utils {
  //this is flushbar
  static void Show_Flushbar_Error_Message(
      String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          title: "Error",
          titleColor: Colors.white,
          icon: const Icon(Icons.error),
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.BOTTOM,
          messageColor: Colors.white,
          backgroundColor: Colors.red,
        )..show(context));
  }
  //////////////////////////////////

  // Show a SnackBar message
  static void showSnackbarMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }
  //////////////////////////////////////
}
