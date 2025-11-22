import 'package:meal_planning_app/features/Auth/domain/entities/user_profile.dart';

class CalorieCalculator {
  double calculateBmr(UserProfileEntity profile) {
    final w = profile.weight;
    final h = profile.height;
    final a = profile.age;

    if (profile.gender.toLowerCase() == 'male') {
      return 10 * w + 6.25 * h - 5 * a + 5;
    } else {
      return 10 * w + 6.25 * h - 5 * a - 161;
    }
  }

  double calculateTdee(UserProfileEntity profile, double activityFactor) {
    final bmr = calculateBmr(profile);
    return bmr * activityFactor;
  }
}
