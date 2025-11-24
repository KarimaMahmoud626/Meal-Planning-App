import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_state.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/day_card.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/planner_meals_grid_view.dart';

class PlansViewBody extends StatefulWidget {
  const PlansViewBody({super.key});

  @override
  State<PlansViewBody> createState() => _PlansViewBodyState();
}

class _PlansViewBodyState extends State<PlansViewBody> {
  DateTime? expandedDay;
  late final List<DateTime> weekDays;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    weekDays = List.generate(7, (i) => now.add(Duration(days: i)));
    expandedDay = now;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
        ),
        BlocBuilder<PlannerCubit, PlannerState>(
          builder: (BuildContext context, PlannerState state) {
            if (state is PlannerLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PlannerLoadded) {
              switch (expandedDay!.weekday) {
                case DateTime.monday:
                  return PlannerMealsGridView(plan: state.planModel.monday);
                case DateTime.tuesday:
                  return PlannerMealsGridView(plan: state.planModel.tuesday);
                case DateTime.wednesday:
                  return PlannerMealsGridView(plan: state.planModel.wednesday);
                case DateTime.thursday:
                  return PlannerMealsGridView(plan: state.planModel.thursday);
                case DateTime.friday:
                  return PlannerMealsGridView(plan: state.planModel.friday);
                case DateTime.saturday:
                  return PlannerMealsGridView(plan: state.planModel.saturday);
                case DateTime.sunday:
                  return PlannerMealsGridView(plan: state.planModel.sunday);
              }
              return PlannerMealsGridView(plan: state.planModel.friday);
            } else if (state is PlannerFailure) {
              return Center(child: Text('${state.message}'));
            } else {
              return Center(child: Text(''));
            }
          },
        ),
      ],
    );
  }
}
