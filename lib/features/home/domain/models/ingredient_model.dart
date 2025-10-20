import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class IngredientModel extends Equatable {
  final String ingredientName;
  final String ingredientMeasure;

  IngredientModel({
    required this.ingredientName,
    required this.ingredientMeasure,
  });

  // factory IngredientModel.fromJson(Map<String, dynamic> ingredientData){
  //   return IngredientModel(ingredient: ingredientData[]);
  // }

  Map<String, dynamic> toJson() => {
    kMealIngredientName: ingredientName,
    kMealIngredientMeasure: ingredientMeasure,
  };

  @override
  List<Object?> get props => [ingredientMeasure, ingredientName];
}
