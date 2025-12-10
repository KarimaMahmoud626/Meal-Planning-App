import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/meals/data/models/search_meal_model.dart';
import 'package:meal_planning_app/features/meals/data/repos/search_meal_repo_impl.dart';

class SearchMealUseCase {
  final repo = SearchMealRepoImpl();

  Future<Either<Exception, List<SearchMealModel>>> call(String name) async {
    return await repo.searchMealsByName(name);
  }
}
