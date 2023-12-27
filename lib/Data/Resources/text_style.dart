import 'package:flutter/material.dart';
import 'package:rite_funeral_flutter/Data/Resources/colors.dart';

class Styles {
  static TextStyle light(
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextDecoration? decoration,
      double? letterSpacing}) {
    return TextStyle(
        fontSize: 14,
        decoration: decoration,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.light,
        fontFamily: "Satoshi-light",
        fontWeight: fontWeight ?? FontWeight.w300);
  }

  static TextStyle regular(
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      TextDecoration? decoration,
      double? letterSpacing}) {
    return TextStyle(
        fontSize: 14,
        decoration: decoration,
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.regular,
        fontFamily: "Satoshi-regular",
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  static TextStyle medium(
      {double? fontSize,
      Color? color,
      double height = 1.4,
      TextDecoration? decoration,
      FontWeight? fontWeight,
      double? letterSpacing}) {
    return TextStyle(
        letterSpacing: letterSpacing ?? 0,
        fontSize: fontSize?? 15.0,
        decoration: decoration,
        color: color ?? AppColors.medium,
        fontFamily: "Satoshi-medium",
        height: height,
        fontWeight: fontWeight ?? FontWeight.w600);
  }

  static TextStyle bold({
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
        fontSize: fontSize ?? 14.0,
        decoration: decoration,
        color: color ?? AppColors.bold,
        fontFamily: "Satoshi-bold",
        fontWeight: FontWeight.w700);
  }
}
