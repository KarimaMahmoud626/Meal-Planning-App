import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';

class RoundedRectangleImageContainer extends StatelessWidget {
  const RoundedRectangleImageContainer({
    super.key,
    this.image,
    this.height = 11,
    this.width = 20,
    this.borderRadius = 10,
  });

  final String? image;
  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final double finalHeight = height * SizeConfig.defaultSize!;
    final double finalWidth = width * SizeConfig.defaultSize!;

    return Container(
      height: finalHeight,
      width: finalWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: kMainColor),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child:
            image != null
                ? Image.asset(
                  image!,
                  fit: BoxFit.cover,
                  width: finalWidth,
                  height: finalHeight,
                )
                : Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported),
                ),
      ),
    );
  }
}
