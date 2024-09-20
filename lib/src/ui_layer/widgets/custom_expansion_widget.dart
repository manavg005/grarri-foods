import 'package:flutter/material.dart';
import 'package:grarri/src/data_layer/res/colors.dart';
import 'package:grarri/src/data_layer/res/extensions.dart';
import 'package:grarri/src/data_layer/res/fonts.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final Key? key; // Add key parameter

  const CustomExpansionTile({
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.key, // Accept key
  }) : super(key: key); // Pass key to StatefulWidget

  @override
  State<CustomExpansionTile> createState() => CustomExpansionTileState();
}

class CustomExpansionTileState extends State<CustomExpansionTile> {
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: widget.key,
        initiallyExpanded: _isExpanded,
        title: Row(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: AppColors.gray74,
                fontSize: 14.fSize,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.ubuntu,
              ),
            ),
            8.sbWidth,
            Expanded(
              child: Container(
                height: 1,
                color:
                    AppColors.gray74.withOpacity(0.5), // Line below the title
              ),
            ),
          ],
        ),
        trailing: AnimatedRotation(
          turns: _isExpanded ? 0.5 : 0, // 0.5 = 180 degrees
          duration: const Duration(milliseconds: 300),
          child: const Icon(
            Icons.arrow_drop_down_rounded,
            size: 30,
          ),
        ),
        iconColor: AppColors.selectedLabelText,
        onExpansionChanged: (bool expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
        children: [widget.child],
      ),
    );
  }
}
