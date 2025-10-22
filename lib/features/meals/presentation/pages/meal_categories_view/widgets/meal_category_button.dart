import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class MealCategoryButton extends StatelessWidget {
  const MealCategoryButton({
    super.key,
    this.onPressed,
    required this.categoryName,
    required this.categoryImageUrl,
  });

  final void Function()? onPressed;
  final String categoryName;
  final String categoryImageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.defaultSize! * 20,
      width: SizeConfig.defaultSize! * 20,
      child: Stack(
        children: [
          RoundedRectangleNetworkImageContainer(
            isBordered: false,
            image: categoryImageUrl,
            height: 20,
            width: 20,
          ),
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
