import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/day_card.dart';

class DayList extends StatefulWidget {
  const DayList({super.key});

  @override
  State<DayList> createState() => _DayListState();
}

class _DayListState extends State<DayList> {
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
    return SizedBox(
      height: SizeConfig.defaultSize! * 13,
      child: ListView.builder(
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
            child: DayCard(day: day, isSelected: isExpanded),
          );
        },
      ),
    );
  }

  String dayName(DateTime date) {
    return DateFormat.E().format(date);
  }
}
