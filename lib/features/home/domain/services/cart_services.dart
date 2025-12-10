class CartServices {
  double calculateTotalPrice(List<num?> prices, List<num?> quantity) {
    double pricesSum = 0;
    for (int i = 0; i < prices.length; i++) {
      pricesSum += (prices[i] ?? 0) * (quantity[i] ?? 0);
    }
    return pricesSum;
  }

  double calculateTotalCalories(List<num?> caloriesList, List<num?> quantity) {
    double caloriesSum = 0;
    for (int i = 0; i < caloriesList.length; i++) {
      caloriesSum += (caloriesList[i] ?? 0) * (quantity[i] ?? 0);
    }
    return caloriesSum;
  }

  double calculateCaloriPercent(double caloriesSum, double neededCalories) {
    return (caloriesSum / neededCalories) * 100;
  }
}
