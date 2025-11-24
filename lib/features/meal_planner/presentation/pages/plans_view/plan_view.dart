import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/widgets/custom_app_bar.dart';
import 'package:meal_planning_app/features/meal_planner/data/repos/meal_planner_repo_impl.dart';
import 'package:meal_planning_app/features/meal_planner/domain/usecases/get_week_plan_usecase.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/widgets/plans_view_body.dart';

class PlanView extends StatelessWidget {
  const PlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (BuildContext context) => PlannerCubit(
            getWeekPlanUsecase: GetWeekPlanUsecase(repo: MealPlannerRepoImpl()),
          )..getWeekPlan(),
      child: Scaffold(
        appBar: SimpleAppBar(
          pageName: 'Plan Your Meals',
          withDefaultColor: false,
        ),
        body: PlansViewBody(),
      ),
    );
  }
}
