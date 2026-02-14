import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/meal_planner/core/constants.dart';

class MealInfoModel extends Equatable {
  final num servings;
  final num mealId;
  final String mealTitle;
  final String mealImage;
  final num readyMin;
  final String mealUrl;

  const MealInfoModel({
    required this.readyMin,
    required this.mealUrl,
    required this.servings,
    required this.mealId,
    required this.mealTitle,
    required this.mealImage,
  });

  factory MealInfoModel.fromJson(Map<String, dynamic> jsonData) {
    return MealInfoModel(
      servings: jsonData[kServings] ?? 0,
      mealId: jsonData[kId] ?? 0,
      mealTitle: jsonData[kTitle] ?? '',
      mealImage: jsonData[kImage] ?? '',
      readyMin: jsonData[kReadyInMin] ?? '',
      mealUrl: jsonData[kMealSourceUrl] ?? '',
    );
  }
  @override
  List<Object?> get props => [servings, mealId, mealTitle, mealImage];
}
