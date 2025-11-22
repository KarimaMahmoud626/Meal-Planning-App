import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meal_planner/domain/models/meal_info_model.dart';

class PlannerMealModel extends Equatable {
  final num itemId;
  final num itemSlot;
  final num itemPosition;
  final String type;
  final MealInfoModel value;

  const PlannerMealModel({
    required this.type,
    required this.itemId,
    required this.itemSlot,
    required this.itemPosition,
    required this.value,
  });

  factory PlannerMealModel.fromJson(Map<String, dynamic> jsonData) {
    return PlannerMealModel(
      type: jsonData[kType],
      itemId: jsonData[kId],
      itemPosition: jsonData[kPosition],
      itemSlot: jsonData[kSlot],
      value: MealInfoModel.fromJson(jsonData[kValue]),
    );
  }

  @override
  List<Object?> get props => [type, itemId, itemPosition, itemSlot, value];
}
