import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.day, required this.isSelected});

  final DateTime day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color color = isSelected ? kMainColor : Colors.grey.shade300;
    return AnimatedContainer(
      width: SizeConfig.defaultSize! * 7,
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 2),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dayName(day),
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          // VerticalSpace(0.5),
          Text(dayNumber(day), style: TextStyle(fontSize: 16, color: color)),
        ],
      ),
    );
  }

  String dayName(DateTime date) {
    return DateFormat.E().format(date);
  }

  String dayNumber(DateTime date) {
    return date.day.toString();
  }
}
