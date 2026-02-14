import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_planning_app/core/routes/app_routes.dart';
import 'package:meal_planning_app/core/routes/route_generator.dart';
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/get_user_data_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/home/data/repos/cart_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/repos/fav_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';
import 'package:meal_planning_app/features/home/domain/usecases/calculate_cart_calorie_and_price_use_case.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/data/repos/meal_planner_repo_impl.dart';
import 'package:meal_planning_app/features/meal_planner/domain/usecases/get_week_plan_usecase.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meals/data/repos/fav_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/data/repos/suggested_meal_repo_impl.dart';
import 'package:meal_planning_app/features/meals/domain/usecases/search_meal_use_case.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/splash/presentation/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

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
                  GrocerryItemsCubit(repo: FetchGrocerryItemsRepoImpl())
                    ..getGrocerryItems('vegetables'),
        ),
        BlocProvider(
          create:
              (context) => CartCubit(
                calculateCalorieAndPriceUsecase:
                    CalculateCartCalorieAndPriceUseCase(
                      services: CartServices(),
                    ),
                repo: CartRepoImpl(),
              )..getCartItems(),
        ),
        BlocProvider(
          create:
              (context) =>
                  FavouriteCubit(repo: FavRepoImpl(FirebaseFirestore.instance))
                    ..getFavItems(),
        ),
        BlocProvider(
          create:
              (context) => AuthCubit(
                getUserDataUseCase: GetUserDataUseCase(AuthRepoImpl()),
              )..getUserData(),
        ),
        BlocProvider(
          create: (context) => FavMealsCubit(FavMealRepoImpl())..getFavMeals(),
        ),
        BlocProvider(
          create:
              (context) => MealsCubit(
                searchMealUseCase: SearchMealUseCase(),
                repo: SuggestedMealRepoImpl(),
              )..getSuggestedMeals(4),
        ),
        BlocProvider(
          create:
              (BuildContext context) => PlannerCubit(
                getWeekPlanUsecase: GetWeekPlanUsecase(
                  repo: MealPlannerRepoImpl(),
                ),
              )..getWeekPlan(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
