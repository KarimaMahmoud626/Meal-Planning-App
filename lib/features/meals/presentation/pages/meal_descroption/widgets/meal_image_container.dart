import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/core/widgets/custom_icon_button.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/widgets/meal_fav_button.dart';

class MealImageContainer extends StatelessWidget {
  const MealImageContainer({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    double width = SizeConfig.defaultSize! * SizeConfig.screenWidth!;
    double height = SizeConfig.defaultSize! * 25;
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          constraints: BoxConstraints(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              meal.mealImageUrl,
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 5,
          left: SizeConfig.defaultSize! * 3,
          child: CustomIconButton(
            icon: Icons.close,
            buttonColor: Colors.white,
            iconColor: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 5,
          right: SizeConfig.defaultSize! * 3,
          child: BlocProvider.value(
            value: BlocProvider.of<FavMealsCubit>(context)..getFavMeals(),
            child: MealFavButton(meal: meal, iconSize: 28),
          ),
        ),
        Positioned(
          bottom: SizeConfig.defaultSize! * 3,
          left: SizeConfig.defaultSize! * 3,
          child: Text(
            meal.mealName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
