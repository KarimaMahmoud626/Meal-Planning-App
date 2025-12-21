import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/data/repos/fav_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/data/repos/suggested_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/utils/open_video.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/custom_floating_action_button.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/meal_description_view_body.dart';

class MealDescriptionView extends StatelessWidget {
  const MealDescriptionView({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) =>
                  MealsCubit(repo: SuggestedMealRepoImpl())
                    ..getMealsById(meal.mealId),
        ),
        BlocProvider(
          create: (_) => FavMealsCubit(FavMealRepoImpl())..getFavMeals(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MealDescriptionViewBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => openVideo(meal.mealVideoUrl),
        ),
      ),
    );
  }
}
