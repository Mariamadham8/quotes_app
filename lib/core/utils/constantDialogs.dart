import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class ConstantDialogs {
  static void ShowErrorDialog({
    required BuildContext context,
    required String msg,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(title: Text('Warning'),
            content: Text(msg),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );

    void showToast({required String msg, Color? color, ToastGravity? gravity}) {
      Fluttertoast.showToast(
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
        gravity: gravity ?? ToastGravity.BOTTOM,
        msg: msg,
      );
    }
  }
}
