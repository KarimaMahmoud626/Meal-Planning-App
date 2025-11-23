import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';

class FavMealModel extends Equatable {
  final String mealName;
  final String mealId;
  final String mealImageUrl;
  final String mealCategory;
  final bool liked;
  final String mealArea;

  const FavMealModel({
    required this.mealArea,
    required this.mealName,
    required this.mealId,
    required this.mealImageUrl,
    required this.liked,
    required this.mealCategory,
  });

  factory FavMealModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FavMealModel(
      mealName: data[kMealName],
      mealImageUrl: data[kMealImageUrl],
      liked: data[kLiked] ?? false,
      mealId: doc.id,
      mealCategory: data[kMealCategory] ?? '',
      mealArea: data[kMealArea] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    final data = <String, dynamic>{
      kMealName: mealName,
      kMealId: mealId,
      kMealImageUrl: mealImageUrl,
      kMealArea: mealArea,
      kMealCategory: mealCategory,
      kLiked: liked,
    };
    return data;
  }

  factory FavMealModel.fromMealModel(MealModel meal) {
    return FavMealModel(
      mealArea: meal.mealArea ?? '',
      mealName: meal.mealName,
      mealImageUrl: meal.mealImageUrl,
      liked: meal.liked ?? false,
      mealCategory: meal.mealCategory,
      mealId: meal.mealId,
    );
  }

  @override
  List<Object?> get props => [
    mealArea,
    mealCategory,
    mealName,
    mealId,
    mealImageUrl,
    liked,
  ];
}
