import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;

  const ImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      key: key,
      height: height,
      width: width,
      color: color,
      fit: fit,
    );
  }
}

class SvgImageWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  const SvgImageWidget({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.none,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imagePath,
      key: key,
      height: height,
      width: width,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
      fit: fit,
    );
  }
}
