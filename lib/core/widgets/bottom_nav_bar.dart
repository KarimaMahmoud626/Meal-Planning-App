import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/core/utils/size_config.dart';
import 'package:meal_planning_app/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/get_user_data_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_cubit.dart';
import 'package:meal_planning_app/features/home/data/repos/cart_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';
import 'package:meal_planning_app/features/home/domain/usecases/calculate_cart_calorie_and_price_use_case.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/cart_cubit/cubit/cart_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/favorite_cubit/cubit/favorite_cubit.dart';
import 'package:meal_planning_app/features/home/presentation/manager/cubits/grocerry_items_cubit/cubit/grocerry_items_cubit.dart';
import 'package:meal_planning_app/features/meal_planner/data/repos/meal_planner_repo_impl.dart';
import 'package:meal_planning_app/features/meal_planner/domain/usecases/get_week_plan_usecase.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/manager/planner_cubit/planner_cubit.dart';
import 'package:meal_planning_app/features/meals/domain/usecases/search_meal_use_case.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/fav_meals_cubit/cubit/fav_meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/manager/meals_cubit/cubit/meals_cubit.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/fav_meals_view/fav_meals_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/suggested_meals/suggested_meals_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:meal_planning_app/features/home/presentation/pages/grocerry/home_view.dart';
import 'package:meal_planning_app/features/home/presentation/pages/cart/cart_view.dart';

class BottomNavContainer extends StatelessWidget {
  BottomNavContainer({super.key});

  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 1,
  );

  List<Widget> _buildScreens() {
    return [
      const CartView(),
      const HomeView(),
      const SuggestedMealsView(),
      const FavMealsView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        title: ("Cart"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.category_outlined),
        title: ("Grocery"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.fastfood_outlined),
        title: ("Meals"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_outlined),
        title: ("Favorites"),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        activeColorPrimary: kMainColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final repo = AuthRepoImpl();
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
        BlocProvider(create: (context) => FavouriteCubit()..getFavItems()),
        BlocProvider(
          create:
              (context) =>
                  AuthCubit(getUserDataUseCase: GetUserDataUseCase(repo))
                    ..getUserData(),
        ),
        BlocProvider(create: (context) => FavMealsCubit()..getFavMeals()),
        BlocProvider(
          create:
              (context) =>
                  MealsCubit(searchMealUseCase: SearchMealUseCase())
                    ..getSuggestedMeals(4),
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
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        navBarHeight: SizeConfig.defaultSize! * 7,
        confineToSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(20.0),
          colorBehindNavBar: Colors.white,
        ),
        //popAllScreensOnTapOfSelectedTab: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        navBarStyle: NavBarStyle.style14,
      ),
    );
  }
}
