import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planning_app/features/Auth/domain/entities/user_profile.dart';
import 'package:meal_planning_app/features/Auth/domain/services/calorie_calculator.dart';

void main() {
  group('BMR Calculation Tests', () {
    test('should calculate correct BMR for male', () {
      final calculator = CalorieCalculator();
      double weight = 70;
      double height = 175;
      int age = 25;
      String gender = 'male';

      double bmr = calculator.calculateBmr(
        UserProfileEntity(
          gender: gender,
          height: height,
          weight: weight,
          age: age,
        ),
      );

      expect(bmr, 1673.75);
    });

    test('should calculate correct BMR for female', () {
      final calculator = CalorieCalculator();

      double weight = 60;
      double height = 165;
      int age = 25;
      String gender = 'female';

      double bmr = calculator.calculateBmr(
        UserProfileEntity(
          gender: gender,
          height: height,
          weight: weight,
          age: age,
        ),
      );

      expect(bmr, 1345.25);
    });
  });
}
