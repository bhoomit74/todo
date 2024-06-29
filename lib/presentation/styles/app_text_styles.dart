import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/presentation/styles/styles.dart';

class AppTextStyle {
  static TextStyle h1({Color? color}) => style(
      fontSize: 40, fontWeight: FontWeight.w500, height: 1.1, color: color);

  static TextStyle h2({Color? color}) =>
      style(fontSize: 32, fontWeight: FontWeight.w500, color: color);

  static TextStyle h3({Color? color}) =>
      style(fontSize: 24, fontWeight: FontWeight.w500, color: color);

  static TextStyle h4({Color? color}) =>
      style(fontSize: 18, fontWeight: FontWeight.bold, color: color);

  static TextStyle h3Normal({Color? color}) =>
      style(fontSize: 24, color: color);

  static TextStyle h4Normal({Color? color}) =>
      style(fontSize: 18, color: color);

  static TextStyle body({Color? color}) => style(fontSize: 14, color: color);
  static TextStyle caption({Color? color}) => style(fontSize: 12, color: color);

  static TextStyle bodyBold({Color? color}) =>
      style(fontSize: 14, fontWeight: FontWeight.bold, color: color);
  static TextStyle captionBold({Color? color}) =>
      style(fontSize: 12, fontWeight: FontWeight.bold, color: color);

  static TextStyle button({Color? color}) => style(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: color ?? AppColors.white);

  static TextStyle activeChip = bodyBold(color: AppColors.primary);
  static TextStyle chip = body(color: AppColors.grey);

  static TextStyle style(
          {Color? color,
          double fontSize = 16,
          double? height,
          FontWeight fontWeight = FontWeight.normal}) =>
      TextStyle(
          color: color ?? AppColors.black,
          fontSize: fontSize,
          height: height,
          fontFamily:
              GoogleFonts.montserrat(fontWeight: fontWeight).fontFamily);
}
