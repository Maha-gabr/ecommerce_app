import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class AppToast {
  static void appToast(
      {
        final String text = ' Updated Successfully',
        final Color color = Colors.green
      }
      )async{
     await Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 6,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16
    );
  }
}