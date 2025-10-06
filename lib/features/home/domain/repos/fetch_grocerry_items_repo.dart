import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';

abstract class FetchGrocerryItemsRepo {
  Future<Either<Exception, List<GrocerryItemModel>>> fetchGrocerryData();
}
