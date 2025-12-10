import 'package:flutter_test/flutter_test.dart';
import 'package:meal_planning_app/features/home/domain/services/cart_services.dart';

void main() {
  group('Cart Services Tests', () {
    test('Should calculate correct total price for list of grocery items', () {
      final cartService = CartServices();

      List<num> prices = [1, 2, 3, 2, 5];
      List<num> quantity = [1, 2, 3, 1, 4];

      double totalPrice = cartService.calculateTotalPrice(prices, quantity);

      expect(totalPrice, 36);
    });

    test(
      'Should calculate correct total calories for list of grocery items',
      () {
        final cartService = CartServices();

        List<num> calories = [20, 25, 32, 42, 50];
        List<num> quantity = [1, 2, 3, 1, 4];

        double totalCalories = cartService.calculateTotalCalories(
          calories,
          quantity,
        );

        expect(totalCalories, 408);
      },
    );

    test(
      'Should calculate correct percentage between total selected calories and needed calories for list of grocery items',
      () {
        final cartService = CartServices();

        double caloriesSum = 500;
        double neededCalories = 1400.25;

        double percent = cartService.calculateCaloriPercent(
          caloriesSum,
          neededCalories,
        );

        expect(percent, closeTo(35.7079, 0.0001));
      },
    );
  });
}
