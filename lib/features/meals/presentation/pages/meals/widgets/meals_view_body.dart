import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MealsCubit(),
      child: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
