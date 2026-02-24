import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/core/di/dependency_injection_container.dart';
import 'package:meal_planning_app/features/meals/data/models/search_meal_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/search_meal_repo.dart';

class SearchMealUseCase {
  final repo = getIt<SearchMealRepo>();

  Future<Either<Exception, List<SearchMealModel>>> call(String name) async {
    return await repo.searchMealsByName(name);
  }
}
