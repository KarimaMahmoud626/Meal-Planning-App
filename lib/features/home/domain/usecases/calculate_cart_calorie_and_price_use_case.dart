import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';

class CalculateCartCalorieAndPriceUseCase {
  final CartServices services;

  CalculateCartCalorieAndPriceUseCase({required this.services});

  double calcCalories({List<num?>? caloriesList, List<num?>? quantity}) {
    return services.calculateTotalCalories(caloriesList!, quantity!);
  }

  double calcPrice({List<num?>? pricessList, List<num?>? quantity}) {
    return services.calculateTotalPrice(pricessList!, quantity!);
  }

  double calcCaloriesPercent({double? caloriesSum, double? neededCalories}) {
    return services.calculateCaloriPercent(caloriesSum!, neededCalories!);
  }
}
