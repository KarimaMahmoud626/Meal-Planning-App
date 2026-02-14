import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';

class SearchMealModel extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String? imageType;

  const SearchMealModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.imageType,
  });

  factory SearchMealModel.fromJson(Map<String, dynamic> jsonData) {
    return SearchMealModel(
      id: jsonData[kId],
      title: jsonData[kTitle],
      imageUrl: jsonData[kImage],
      imageType: jsonData["imageType"],
    );
  }

  factory SearchMealModel.fromMealModel(MealModel meal) {
    return SearchMealModel(
      title: meal.mealName,
      imageUrl: meal.mealImageUrl,
      id: meal.mealId,
    );
  }

  @override
  List<Object?> get props => [id, title, imageUrl];
}
