import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/rounded_rectangle_image_container.dart';

class CalendarMealCard extends StatelessWidget {
  const CalendarMealCard({
    super.key,
    required this.mealName,
    required this.isSelected,
  });

  final String mealName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final double width =
        isSelected ? SizeConfig.defaultSize! * 15 : SizeConfig.defaultSize! * 7;
    return AnimatedContainer(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(milliseconds: 250),
      child: Stack(
        children: [
          RoundedRectangleNetworkImageContainer(
            image:
                "https://www.themealdb.com/images/media/meals/llcbn01574260722.jpg",
            height: 13,
            width: width,
            isBordered: false,
            isPadded: false,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Center(
              child: Text(
                mealName,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.transparent,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(
                Icons.delete,
                color: isSelected ? Colors.grey : Colors.transparent,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
