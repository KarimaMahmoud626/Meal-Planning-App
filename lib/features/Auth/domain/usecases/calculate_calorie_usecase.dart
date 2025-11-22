import 'package:meal_planning_app/features/Auth/domain/entities/user_profile.dart';
import 'package:meal_planning_app/features/Auth/domain/services/calorie_calculator.dart';

class CalculateCalorieUsecase {
  final CalorieCalculator calculator;

  CalculateCalorieUsecase({required this.calculator});

  double execute({required UserProfileEntity profile, double? activityFactor}) {
    if (activityFactor != null) {
      return calculator.calculateTdee(profile, activityFactor);
    } else {
      return calculator.calculateBmr(profile);
    }
  }
}
