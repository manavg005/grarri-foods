import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grarri/src/business_layer/util/helper/device_info_helper.dart';
import 'package:grarri/src/data_layer/res/res.dart';

class AppStyles {
  /// Private constructor to prevent class instantiation
  AppStyles._();

  /// Text styles
  static ubuntuTextStyle({
    Color color = AppColors.gray74,
    double fontSize = d_14,
    double height = onePointTwo,
    TextDecoration? decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      fontFamily: AppFonts.ubuntu,
    );
  }

  static mediumTextStyle({
    Color color = AppColors.black,
    double fontSize = d_14,
    double height = onePointFive,
    TextDecoration? decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      decoration: decoration,
      fontFamily: AppFonts.poppins,
    );
  }

  static semiBoldSecondTextStyle({
    Color color = AppColors.black,
    double fontSize = d_14,
    double height = onePointFive,
    TextDecoration? decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: FontWeight.w700,
      color: color,
      height: height,
      decoration: decoration,
      fontFamily: AppFonts.poppins,
    );
  }

  static semiBoldTextStyle({
    Color color = AppColors.black,
    double fontSize = d_14,
    double height = onePointFive,
    TextDecoration? decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
      fontSize: getFontSize(fontSize),
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      fontFamily: AppFonts.poppins,
    );
  }

  /// Method used to get font size according to device
  static double getFontSize(double value) {
    if (DeviceInfo.width > 450) {
      return value;
    }
    return value.sp;
  }

  /// Method used to get height according to device
  static double getHeight(double value) {
    if (DeviceInfo.width > 450) {
      return value;
    }
    return value.h;
  }

  /// Method used to get width according to device
  static double getWidth(double value) {
    if (DeviceInfo.width > 450) {
      return value;
    }
    return value.w;
  }

  /// Padding
  /// Paddings
  static EdgeInsets pd0 = const EdgeInsets.all(d_0);
  static EdgeInsets pd1 = const EdgeInsets.all(d_1);
  static EdgeInsets pd2 = const EdgeInsets.all(d_2);
  static EdgeInsets pd3 = const EdgeInsets.all(d_3);
  static EdgeInsets pd4 = const EdgeInsets.all(d_4);
  static EdgeInsets pd5 = const EdgeInsets.all(d_5);
  static EdgeInsets pd6 = const EdgeInsets.all(d_6);
  static EdgeInsets pd7 = const EdgeInsets.all(d_7);
  static EdgeInsets pd8 = const EdgeInsets.all(d_8);
  static EdgeInsets pd9 = const EdgeInsets.all(d_9);
  static const EdgeInsets pd10 = EdgeInsets.all(d_10);
  static EdgeInsets pd11 = const EdgeInsets.all(d_11);
  static EdgeInsets pd12 = const EdgeInsets.all(d_12);
  static EdgeInsets pd13 = const EdgeInsets.all(d_13);
  static const pd14 = EdgeInsets.all(d_14);
  static EdgeInsets pd15 = const EdgeInsets.all(d_15);
  static EdgeInsets pd16 = const EdgeInsets.all(d_16);
  static EdgeInsets pd17 = const EdgeInsets.all(d_17);
  static EdgeInsets pd18 = const EdgeInsets.all(d_18);
  static EdgeInsets pd19 = const EdgeInsets.all(d_19);
  static EdgeInsets pd20 = const EdgeInsets.all(d_20);
  static EdgeInsets pd21 = const EdgeInsets.all(d_21);
  static EdgeInsets pd23 = const EdgeInsets.all(d_23);
  static EdgeInsets pd24 = const EdgeInsets.all(d_24);
  static EdgeInsets pd25 = const EdgeInsets.all(d_25);
  static EdgeInsets pd30 = const EdgeInsets.all(d_30);
  static EdgeInsets pd35 = const EdgeInsets.all(d_35);
  static EdgeInsets pd40 = const EdgeInsets.all(d_40);
  static EdgeInsets pd45 = const EdgeInsets.all(d_45);
  static EdgeInsets pd50 = const EdgeInsets.all(d_50);
  static EdgeInsets pd100 = const EdgeInsets.all(d_100);

  static EdgeInsets pdT5 = const EdgeInsets.only(top: d_5);
  static EdgeInsets pdT8 = const EdgeInsets.only(top: d_8);
  static EdgeInsets pdL14 = const EdgeInsets.only(left: d_14);
  static EdgeInsets pdL10 = const EdgeInsets.only(left: d_10);
  static EdgeInsets pdT95 = const EdgeInsets.only(top: d_95);
  static EdgeInsets pdT10 = const EdgeInsets.only(top: d_10);
  static EdgeInsets pdT15 = const EdgeInsets.only(top: d_15);
  static EdgeInsets pdL27 = const EdgeInsets.only(left: d_27);
  static EdgeInsets pdL30 = const EdgeInsets.only(left: d_30);
  static EdgeInsets pdL6R20 = const EdgeInsets.only(left: d_6, right: d_20);
  static EdgeInsets pdT7R7 = const EdgeInsets.only(top: d_7, right: d_7);
  static EdgeInsets pdT14B13 = const EdgeInsets.only(top: d_14, bottom: d_13);
  static EdgeInsets pdT34B51L12R12 =
      const EdgeInsets.only(left: d_12, right: d_12, top: d_34, bottom: d_51);
  static EdgeInsets pdT18B50L12R12 =
      const EdgeInsets.only(top: d_18, bottom: d_50, right: d_12, left: d_12);
  static EdgeInsets pdT9B16L31R14 =
      const EdgeInsets.only(top: d_9, bottom: d_16, right: d_14, left: d_31);
  static EdgeInsets pdT18B62L20R18 =
      const EdgeInsets.only(top: d_18, bottom: d_62, right: d_18, left: d_20);
  static EdgeInsets pdB4 = const EdgeInsets.only(
    bottom: d_4,
  );
  static EdgeInsets pdL12T4B4R4 =
      const EdgeInsets.only(left: 12, bottom: 4, right: 4, top: 4);

  static const EdgeInsets pdH16V8 =
      EdgeInsets.symmetric(horizontal: d_16, vertical: d_8);
  static EdgeInsets pdH16 =
      const EdgeInsets.symmetric(horizontal: d_16, vertical: 0);

  static void setDeviceOrientationOfApp() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
  }

  /// Set the status bar color to the widget
  static void setStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        //top bar color
        statusBarIconBrightness: Brightness.light,
        //top bar icons
        systemNavigationBarColor: Colors.black,
        //bottom bar color
        systemNavigationBarIconBrightness: Brightness.light,
        //bottom bar icons
        statusBarBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.black, //bottom bar icons
      ),
    );
  }
}
