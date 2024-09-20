import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/grarri_foods_app.dart';

Future<void> main() async {
  // runZonedGuarded<Future<void>>(() async {
  /// Initialize the WidgetFlutterBinding if required
  WidgetsFlutterBinding.ensureInitialized();

  /// Sets the status bar color of the widget
  AppStyles.setStatusBarTheme();

  /// Ensuring Size of the phone in UI Design
  await ScreenUtil.ensureScreenSize();

  /// Sets the device orientation of the application
  AppStyles.setDeviceOrientationOfApp();

  /// Run the application
  runApp(const GrarriFoods());
  // }, (error, stack) {
  //   /// Record error when caches error
  //   LogHelper.logError(error);
  // });
}
