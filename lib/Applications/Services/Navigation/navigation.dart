import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Navigate {
  Navigate._();

  static to(BuildContext context, Widget child, {Duration? duration}) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static toReplace(BuildContext context, Widget child) {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return child;
      },
    ));
  }

  static toReplaceAll(BuildContext context, Widget child) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => child),
      (route) => false,
    );
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
