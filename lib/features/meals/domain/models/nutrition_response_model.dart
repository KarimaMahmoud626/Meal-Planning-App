import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class NutritionResponseModel extends Equatable {
  final String name;
  final num amount;
  final String unit;
  final num percent;

  const NutritionResponseModel({
    required this.name,
    required this.amount,
    required this.unit,
    required this.percent,
  });

  factory NutritionResponseModel.fromJson(Map<String, dynamic> jsonData) {
    return NutritionResponseModel(
      name: jsonData[kName],
      amount: jsonData[kNutrentAmount],
      unit: jsonData[kNutrentUnit],
      percent: jsonData[kNutrentPercent],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name, amount, unit, percent];
}
