import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/meals/domain/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';

class MealFavButton extends StatefulWidget {
  const MealFavButton({super.key, this.iconSize = 24, required this.meal});

  final double? iconSize;
  final MealModel meal;

  @override
  State<MealFavButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<MealFavButton> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.meal.liked!;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavMealsCubit, FavMealsState>(
      builder: (context, state) {
        bool isInFav = false;
        if (state is FavMealsLoaded) {
          isInFav = state.items.any(
            (favItem) => favItem.mealName == widget.meal.mealName,
          );
        }
        return IconButton(
          isSelected: isInFav,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.black54,
            size: widget.iconSize,
          ),
          selectedIcon: Icon(
            Icons.favorite,
            color: Colors.red,
            size: widget.iconSize,
          ),
          onPressed: () async {
            print('Fav button pressed for meal: ${widget.meal.mealName}');

            final favCubit = context.read<FavMealsCubit>();
            if (isInFav) {
              await favCubit.removeMeal(widget.meal.toFavMealModel());
            } else {
              await favCubit.addMeal(widget.meal);
            }
          },
        );
      },
      listener: (BuildContext context, FavMealsState state) {},
    );
  }
}
