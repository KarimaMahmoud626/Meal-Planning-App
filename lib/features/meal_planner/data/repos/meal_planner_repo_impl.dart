import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/meal_planner/data/models/week_meal_plan_model.dart';
import 'package:meal_planning_app/features/meal_planner/domain/repos/meal_planner_repo.dart';

class MealPlannerRepoImpl extends MealPlannerRepo {
  @override
  Future<Either<Exception, WeekMealPlanModel>> getMealPlans() async {
    final targetCalories = await getUserTargetCalories();
    print('target calories $targetCalories');
    try {
      final planUrl = Uri.parse(
        'https://api.spoonacular.com/mealplanner/generate?timeFrame=week&targetCalories=$targetCalories&apiKey=$kSpoonAcularApiKey',
      );
      http.Response response = await http.get(planUrl);
      print('response: $response');
      if (response.statusCode != 200) {
        return Left(Exception('HTTP error ${response.statusCode}'));
      }
      final jsonData = jsonDecode(response.body);
      if (jsonData is! Map<String, dynamic>) {
        return Left(Exception('Unexpected json format'));
      }
      if (jsonData.containsKey('status') && jsonData['status'] == 'failure') {
        return Left(Exception(jsonData['message'] ?? 'API failure'));
      }
      final plan = WeekMealPlanModel.fromJson(jsonData);
      return Right(plan);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  Future<num> getUserTargetCalories() async {
    final user = FirebaseAuth.instance.currentUser;
    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

    final data = snapshot.data();
    if (data == null) {
      print('null data');
      return 0;
    }
    return data[kNeededCalories];
  }
}
