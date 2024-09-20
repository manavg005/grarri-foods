import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension EmptySpace on num {
  SizedBox get sbHeight => SizedBox(
        height: toDouble().h,
      );

  SizedBox get sbWidth => SizedBox(
        width: toDouble().w,
      );

  SizedBox get sbHeightWidth => SizedBox(
        height: toDouble().h,
        width: toDouble().w,
      );
}

extension ResponsiveExtension on num {
  double get fSize => toDouble().sp;

  double get height => toDouble().h;

  double get width => toDouble().w;
}
