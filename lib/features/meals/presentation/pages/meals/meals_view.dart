import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meals/widgets/meals_view_body.dart';

class MealsView extends StatelessWidget {
  const MealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(pageName: 'Meals'),
      body: MealsViewBody(),
    );
  }
}
