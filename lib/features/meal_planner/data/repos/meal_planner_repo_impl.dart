// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:http/http.dart' as http;
// import 'package:meal_planning_app/core/constants.dart';
// import 'package:meal_planning_app/features/meal_planner/domain/models/day_meal_plan_model.dart';
// import 'package:meal_planning_app/features/meal_planner/domain/repos/meal_planner_repo.dart';

// class MealPlannerRepoImpl extends MealPlannerRepo {
//   @override
//   Future<Either<Exception, List<DayMealPlanModel>>> getMealPlans() async {
//     final List<DayMealPlanModel> plan = [];
//     try {
//       final planUrl = Uri.parse(
//         'https://api.spoonacular.com/mealplanner/$kSpoonAcularUserName/week/${DateTime.now()}?apiKey=$kSpoonAcularApiKey',
//       );
//       http.Response response = await http.get(planUrl);
//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         final days = jsonData['days'] as Map<String, dynamic>;
//         plan.add(DayMealPlanModel.fromJson(days));
//         return Right(plan);
//       } else {
//         return Left(Exception('HTTP error: ${response.statusCode}'));
//       }
//     } catch (e) {
//       return Left(Exception(e.toString()));
//     }
//   }

//   Future<Either<Exception, Map<String, dynamic>>> connectUser() async {
//     print('entering recipe analyze');
//     final url = Uri.parse(
//       'https://api.spoonacular.com/users/connect?apiKey=$kSpoonAcularApiKey',
//     );
//     final body = jsonEncode({
//       "username": "Karima Mahmoud",
//       "firstName": "",
//       "lastName": "",
//       "email": "elnadykarima@gmail.com",
//     });

//     final resp = await http.post(
//       url,
//       body: body,
//       headers: {'Content-Type': 'application/json'},
//     );
//   }
// }
