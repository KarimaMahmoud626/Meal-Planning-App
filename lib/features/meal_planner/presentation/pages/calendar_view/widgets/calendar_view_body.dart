import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/calendar_view/widgets/calendar_meal_card.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/day_card.dart';

class CalendarViewBody extends StatefulWidget {
  const CalendarViewBody({super.key});

  @override
  State<CalendarViewBody> createState() => _CalendarViewBodyState();
}

class _CalendarViewBodyState extends State<CalendarViewBody> {
  DateTime? expandedDay;
  late final List<DateTime> weekDays;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    weekDays = List.generate(7, (i) => now.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(12),
      itemCount: weekDays.length,
      itemBuilder: (context, index) {
        final day = weekDays[index];
        final isExpanded = expandedDay == day;

        return GestureDetector(
          onTap: () {
            setState(() {
              expandedDay = isExpanded ? null : day;
            });
          },
          child: Column(
            children: [
              DayCard(day: day, isSelected: isExpanded),
              CalendarMealCard(mealName: 'mealName', isSelected: isExpanded),
              CalendarMealCard(mealName: 'mealName', isSelected: isExpanded),
              CalendarMealCard(mealName: 'mealName', isSelected: isExpanded),
            ],
          ),
        );
      },
    );
  }

  String dayName(DateTime date) {
    return DateFormat.E().format(date);
  }
}
