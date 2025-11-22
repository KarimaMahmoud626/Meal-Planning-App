import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/plans_view_body.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(
        pageName: 'Plan Your Meals',
        withDefaultColor: false,
      ),
      body: PlansViewBody(),
    );
  }
}
