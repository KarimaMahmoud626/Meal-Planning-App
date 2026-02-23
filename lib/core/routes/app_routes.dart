import 'dart:core';

/// Centralized route definitions for the application.
/// All route names are defined as constants to ensure type safety
/// and prevent typos in navigation code.
class AppRoutes {
  const AppRoutes._();

  // Authentication & Onboarding Routes
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String completeInfo = '/complete-info';

  // Main Navigation
  static const String main = '/main';

  // Home & Shopping Routes
  static const String cart = '/cart';
  static const String grocery = '/grocery';
  static const String favorites = '/favorites';

  // Meal Routes
  static const String meals = '/meals';
  static const String mealsView = '/meals-view';
  static const String mealDescription = '/meal-description';
  static const String mealCategories = '/meal-categories';
  static const String favMeals = '/fav-meals';
  static const String mealPlanner = '/meal-planner';

  static String get initialRoute => splash;
}
