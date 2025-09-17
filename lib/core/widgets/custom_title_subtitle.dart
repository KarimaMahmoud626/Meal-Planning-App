import 'package:flutter/material.dart';

class CustomTitleSubtitle extends StatelessWidget {
  const CustomTitleSubtitle({super.key, this.title, this.subTitle});

  final String? title;
  final String? subTitle;

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
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.left,
          ),
          Text(
            subTitle!,
            style: TextStyle(
              color: Colors.white,
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
