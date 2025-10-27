import 'package:flutter/material.dart';
import 'package:meal_planning_app/core/widgets/space_widget.dart';
import 'package:meal_planning_app/features/meals/domain/models/nutrition_response_model.dart';

class NutritionSummaryBody extends StatelessWidget {
  const NutritionSummaryBody({super.key, required this.items});

  final List<NutritionResponseModel> items;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFF2F9F7),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:
              items.map((nutrient) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      nutrient.name,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    VerticalSpace(1),
                    Text(
                      (nutrient.amount).toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    VerticalSpace(0.3),
                    Text(
                      nutrient.unit,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
