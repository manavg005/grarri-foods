import 'package:flutter/material.dart';

import '../../../../data_layer/res/res.dart';

class MenuContentDivider extends StatelessWidget {
  const MenuContentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      color: Colors.grey,
    );
  }
}

class MenuContent extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const MenuContent({
    super.key,
    this.title = "",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: AppStyles.ubuntuTextStyle(),
          ),
        ),
      ),
    );
  }
}
