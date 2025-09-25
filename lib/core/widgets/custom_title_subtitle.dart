import 'package:flutter/material.dart';

class CustomTitleSubtitle extends StatelessWidget {
  const CustomTitleSubtitle({
    super.key,
    this.title,
    this.subTitle,
    this.titleColor,
    this.subTitleColor,
  });

  final String? title;
  final String? subTitle;
  final Color? titleColor;
  final Color? subTitleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: TextStyle(
              color: titleColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            subTitle!,
            style: TextStyle(
              color: subTitleColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
