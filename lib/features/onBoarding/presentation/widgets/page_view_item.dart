import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.title, this.subTitle, this.image});

  final String? title;
  final String? subTitle;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(20),
        SizedBox(
          height: SizeConfig.defaultSize! * 25,
          child: Image.asset(image!),
        ),
        VerticalSpace(5),
        Text(
          title!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2E41),
          ),
          textAlign: TextAlign.left,
        ),
        VerticalSpace(1.5),
        Text(
          subTitle!,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF78787C),
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
