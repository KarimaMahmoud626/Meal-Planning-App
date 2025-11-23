import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';

abstract class GrocerryItemsRepo {
  Future<Either<Exception, List<GrocerryItemModel>>> getGrocerryData(
    String category,
  );
  Future<void> updateLikedState(String id, bool liked);
}
