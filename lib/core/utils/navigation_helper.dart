import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/routes/app_routes.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';

class NavigationHelper {
  NavigationHelper._();

  static Future<void> toOnboarding(
    BuildContext context, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
    }
    return Navigator.pushNamed(context, AppRoutes.onboarding);
  }

  static Future<void> toLogin(BuildContext context, {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
    return Navigator.pushNamed(context, AppRoutes.login);
  }

  static Future<void> toCompleteInfo(
    BuildContext context, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.completeInfo);
    }
    return Navigator.pushNamed(context, AppRoutes.completeInfo);
  }

  static Future<void> toMain(BuildContext context, {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.main);
    }
    return Navigator.pushNamed(context, AppRoutes.main);
  }

  static Future<void> toMealDescription(
    BuildContext context, {
    required MealModel meal,
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacementNamed(
        context,
        AppRoutes.mealDescription,
        arguments: meal,
      );
    }
    return Navigator.pushNamed(
      context,
      AppRoutes.mealDescription,
      arguments: meal,
    );
  }

  static Future<void> toMealCategories(
    BuildContext context, {
    bool replace = false,
  }) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.mealCategories);
    }
    return Navigator.pushNamed(context, AppRoutes.mealCategories);
  }

  static Future<void> toPlan(BuildContext context, {bool replace = false}) {
    if (replace) {
      return Navigator.pushReplacementNamed(context, AppRoutes.mealPlanner);
    }
    return Navigator.pushNamed(context, AppRoutes.mealPlanner);
  }

  static void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }

  static void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.popUntil(context, predicate);
  }

  static Future<void> popAndPushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.popAndPushNamed(context, routeName, arguments: arguments);
  }

  static Future<void> pushNamedAndRemoveUntil(
    BuildContext context,
    String routeName, {
    Object? arguments,
    RoutePredicate? predicate,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static void maybePop(BuildContext context, [dynamic result]) {
    if (canPop(context)) {
      pop(context, result);
    }
  }
}
