import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/day_list.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/plan_meal_card.dart';

class PlansViewBody extends StatelessWidget {
  const PlansViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DayList(),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.99,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(4),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 0.9,
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return (index < 3) ? PlanMealCard() : PlanMealCard(filled: false);
            },
          ),
        ),
      ],
    );
  }
}
