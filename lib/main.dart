import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_planning_app/core/di/dependency_injection_container.dart';
import 'package:meal_planning_app/core/routes/app_routes.dart';
import 'package:meal_planning_app/core/routes/route_generator.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initDependencies();

  runApp(const MealPlanningApp());
}

class MealPlanningApp extends StatelessWidget {
  const MealPlanningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  getIt<GrocerryItemsCubit>()..getGrocerryItems('vegetables'),
        ),
        BlocProvider(create: (context) => getIt<CartCubit>()..getCartItems()),
        BlocProvider(
          create: (context) => getIt<FavouriteCubit>()..getFavItems(),
        ),
        BlocProvider(create: (context) => getIt<AuthCubit>()..getUserData()),
        BlocProvider(
          create: (context) => getIt<FavMealsCubit>()..getFavMeals(),
        ),
        BlocProvider(
          create: (context) => getIt<MealsCubit>()..getSuggestedMeals(4),
        ),
        BlocProvider(
          create:
              (BuildContext context) => getIt<PlannerCubit>()..getWeekPlan(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
