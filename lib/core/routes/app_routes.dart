import 'dart:core';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String login = '/login';
  static const String completeInfo = '/complete-info';

  static const String main = '/main';

  static const String cart = '/cart';
  static const String grocery = '/grocery';
  static const String meals = '/meals';
  static const String favorits = '/favorits';

  static const String mealDescription = '/meal-description';
  static const String mealPlanner = '/meal-planner';
  static const String mealCategories = '/meal-categories';

  static String get initialRoute => splash;
}
