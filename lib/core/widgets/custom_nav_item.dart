import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/constants.dart';

class CustomNavItem extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomNavItem({
    super.key,
    required this.icon,
    this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isSelected && label != null) {
      return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 40,
          width: 80,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: kMainColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Icon(icon, color: kMainColor),
                SizedBox(width: 6),
                Text(
                  label!,
                  style: TextStyle(
                    color: kMainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          width: 48,
          decoration:
              isSelected
                  ? BoxDecoration(
                    color: kMainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  )
                  : null,
          child: Icon(icon, color: isSelected ? kMainColor : Colors.black),
        ),
      );
    }
  }
}
