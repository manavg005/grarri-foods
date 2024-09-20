import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:grarri/src/data_layer/res/res.dart';

class AppDecorations {
  AppDecorations._();

  /// Border radius
  static final br10 = BorderRadius.circular(10);
  static final br100 = BorderRadius.circular(100);

  /// Gradients
  static LinearGradient blueBackgroundGradient = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topCenter,
    colors: [
      Color.fromRGBO(0, 121, 145, 1),
      Color.fromRGBO(69, 158, 175, 1),
    ],
  );

  static RadialGradient lightGreyGradiant = const RadialGradient(
    // begin: Alignment.bottomLeft,
    // end: Alignment.topCenter,
    // focalRadius: 100,
    radius: 2,
    center: Alignment(-1, 1),
    colors: [
      // Color.fromRGBO(0, 0, 0, 1.0),
      // Color.fromRGBO(0, 0, 0, 0.5),
      Color.fromRGBO(0, 0, 0, 0.32),
      Color.fromRGBO(0, 0, 0, 0.1),
      // Color.fromRGBO(255, 255, 255, 1)
    ],
  );

  /// Grarri App Decoration
  static BoxDecoration outerBoxDecoration = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        color: AppColors.shadowLight,
        offset: Offset(-5.0, -5.0),
        blurRadius: 13.0,
      ),
      BoxShadow(
        color: Color.fromRGBO(222, 222, 222, 0.9),
        offset: Offset(5.0, 5.0),
        blurRadius: 10.0,
      ),

      // BoxShadow(
      //   color: Color.fromRGBO(222, 222, 222, 0.2),
      //   offset: Offset(5.0, -5.0),
      //   blurRadius: 10.0,
      // ),
      // BoxShadow(
      //   color: Color.fromRGBO(222, 222, 222, 0.2),
      //   offset: Offset(-5.0, 5.0),
      //   blurRadius: 10.0,
      // ),
    ],
    color: AppColors.primaryColor,
    borderRadius: BorderRadius.circular(10.0),
  );

  static BoxDecoration innerBoxDecoration = BoxDecoration(
    boxShadow: const [
      BoxShadow(
        offset: Offset(-2, -2),
        blurRadius: 4,
        color: AppColors.shadowLight,
        inset: true,
      ),
      BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 5,
        color: Color.fromRGBO(212, 212, 212, 0.9),
        inset: true,
      ),
    ],
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(10.0),
  );

  static BoxDecoration placeOrderButtonDecoration =
      const BoxDecoration(boxShadow: [
    BoxShadow(
      offset: Offset(-2, -2),
      blurRadius: 4,
      color: Color.fromRGBO(42, 167, 192, 0.9),
      inset: true,
    ),
    BoxShadow(
      offset: Offset(2, 2),
      blurRadius: 5,
      color: Color.fromRGBO(28, 111, 128, 0.9),
      inset: true,
    ),
  ], color: Colors.transparent, shape: BoxShape.circle
          // borderRadius: BorderRadius.circular(10.0),
          );

  static BoxDecoration addIconDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        offset: Offset(-2, -2),
        blurRadius: 4,
        color: AppColors.shadowLight,
        inset: true,
      ),
      BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 5,
        color: Color.fromRGBO(212, 212, 212, 0.9),
        inset: true,
      ),
    ],
    color: Colors.transparent,
  );
}
