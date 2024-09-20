import 'package:flutter/material.dart';
import 'package:grarri/src/data_layer/res/res.dart';
import 'package:grarri/src/ui_layer/widgets/image_widgets.dart';

class CommonButton extends StatelessWidget {
  final String imagePath;
  const CommonButton({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: d_12),
      padding: AppStyles.pd6,
      decoration: AppDecorations.outerBoxDecoration,
      child: SvgImageWidget(
        imagePath: imagePath,
      ),
    );
  }
}

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: d_12),
      padding: AppStyles.pd6,
      decoration: AppDecorations.innerBoxDecoration,
      child: Text(
        text,
        style: AppStyles.ubuntuTextStyle(color: AppColors.selectedLabelText),
      ),
    );
  }
}

class CommonAddButton extends StatelessWidget {
  const CommonAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        top: 4,
        bottom: 4,
        right: 8,
      ),
      decoration: AppDecorations.outerBoxDecoration,
      child: Row(
        children: [
          Container(
            height: 24.height,
            width: 24.width,
            // padding: AppStyles.pd7,
            decoration: AppDecorations.addIconDecoration,
            child: const SvgImageWidget(imagePath: AppImages.addIcon),
          ),
          8.sbWidth,
          Text(
            "ADD",
            style: TextStyle(
              fontSize: 13.fSize,
              height: 1.2,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.ubuntu,
              color: AppColors.gray74,
            ),
          )
        ],
      ),
    );
  }
}

class CommonAddRemoveButton extends StatelessWidget {
  const CommonAddRemoveButton({
    super.key,
    required this.items,
    required this.onTapAdd,
    required this.onTapRemove,
  });

  final int items;
  final VoidCallback onTapAdd;
  final VoidCallback onTapRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppStyles.pd4,
      decoration: AppDecorations.outerBoxDecoration,
      child: Row(
        children: [
          InkWell(
            onTap: onTapRemove,
            child: Container(
              height: 24.height,
              width: 24.width,
              decoration: AppDecorations.addIconDecoration,
              child: const SvgImageWidget(imagePath: AppImages.minusIcon),
            ),
          ),
          8.sbWidth,
          Text(
            "$items",
            style: TextStyle(
              fontSize: 13.fSize,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.ubuntu,
              color: AppColors.gray74,
            ),
          ),
          8.sbWidth,
          InkWell(
            onTap: onTapAdd,
            child: Container(
              height: 24.height,
              width: 24.width,
              // padding: AppStyles.pd7,
              decoration: AppDecorations.addIconDecoration,
              child: const SvgImageWidget(imagePath: AppImages.addIcon),
            ),
          ),
        ],
      ),
    );
  }
}
