import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/meals/data/models/meal_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/suggested_meal_repo.dart';
import 'package:http/http.dart' as http;

class SuggestedMealRepoImpl extends SuggestedMealRepo {
  @override
  Future<Either<Exception, List<MealModel>>> getMealsByCategory(
    String category,
  ) async {
    final List<MealModel> mealsList = [];
    try {
      final mealUrl = Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$category',
      );
      http.Response response = await http.get(mealUrl);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final meals = jsonData['meals'];
        if (meals != null && meals.isNotEmpty) {
          for (var meal in meals) {
            mealsList.add(MealModel.fromJson(meal));
          }
        }
      } else {
        return Left(Exception('HTTP error: ${response.statusCode}'));
      }
      return Right(mealsList);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<MealModel>>> getRandomMeals(
    int numOfMeals,
  ) async {
    final List<MealModel> mealsList = [];
    try {
      for (int i = 0; i < numOfMeals; i++) {
        final mealUrl = Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/random.php?',
        );
        http.Response response = await http.get(mealUrl);
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body);
          final meals = jsonData['meals'];
          if (meals != null && meals.isNotEmpty) {
            mealsList.add(MealModel.fromJson(meals.first));
          }
        } else {
          return Left(Exception('HTTP error: ${response.statusCode}'));
        }
      }
      return Right(mealsList);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, MealModel>> getMealsById(String id) async {
    try {
      final mealUrl = Uri.parse(
        'https://themealdb.com/api/json/v1/1/lookup.php?i=$id',
      );
      http.Response response = await http.get(mealUrl);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final meals = jsonData['meals'];
        if (meals != null && meals.isNotEmpty) {
          final meal = MealModel.fromJson(meals.first);
          return Right(meal);
        } else {
          return Left(Exception('No meal found for id = $id'));
        }
      } else {
        return Left(Exception('HTTP error: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<void> toggleLike(String mealId, bool isLiked) async {
    final firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    await firestore
        .collection('user')
        .doc(user!.uid)
        .collection('fav_meals')
        .doc(mealId)
        .update({'liked': isLiked});
  }
}
