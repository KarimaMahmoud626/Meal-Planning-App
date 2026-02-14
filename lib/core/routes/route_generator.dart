import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/navigation/navigation_sell.dart';
import 'package:meal_planning_app/core/routes/app_routes.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/compelete_info/compelete_information_view.dart';
import 'package:meal_planning_app/features/Auth/presentation/pages/login/login_view.dart';
import 'package:meal_planning_app/features/meal_planner/presentation/pages/plans_view/plan_view.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_categories_view/meal_categories_view.dart';
import 'package:meal_planning_app/features/meals/presentation/pages/meal_descroption/meal_description_view.dart';
import 'package:meal_planning_app/features/onBoarding/presentation/on_boarding_view.dart';
import 'package:meal_planning_app/features/splash/presentation/splash_view.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(const SplashView(), settings: settings);

      case AppRoutes.onboarding:
        return _buildRoute(const OnBoardingView(), settings: settings);

      case AppRoutes.login:
        return _buildRoute(const LoginView(), settings: settings);

      case AppRoutes.completeInfo:
        return _buildRoute(
          const CompeleteInformationView(),
          settings: settings,
        );

      case AppRoutes.main:
        return _buildRoute(NavigationSell(), settings: settings);

      case AppRoutes.mealCategories:
        return _buildRoute(MealCategoriesView(), settings: settings);

      case AppRoutes.mealDescription:
        if (args is MealModel) {
          return _buildRoute(
            MealDescriptionView(meal: args),
            settings: settings,
          );
        }
        return _errorRoute(settings);

      case AppRoutes.mealPlanner:
        return _buildRoute(PlanView(), settings: settings);

      default:
        return _errorRoute(settings);
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    Widget page, {
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  static Route<dynamic> _errorRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder:
          (context) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Route not found: ${settings.name}',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            ),
          ),
      settings: settings,
    );
  }
}
