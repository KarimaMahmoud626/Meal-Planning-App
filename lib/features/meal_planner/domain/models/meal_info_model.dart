import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class MealInfoModel extends Equatable {
  final num servings;
  final num mealId;
  final String mealTitle;
  final String mealImage;

  const MealInfoModel({
    required this.servings,
    required this.mealId,
    required this.mealTitle,
    required this.mealImage,
  });

  factory MealInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return MealInfoModel(
      servings: jsonData[kServings],
      mealId: jsonData[kId],
      mealTitle: jsonData[kTitle],
      mealImage: jsonData[kImage],
    );
  }
  @override
  List<Object?> get props => [servings, mealId, mealTitle, mealImage];
}
