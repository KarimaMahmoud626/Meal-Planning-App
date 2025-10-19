import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';

abstract class FavRepo {
  Future<Either<Exception, List<FavItemModel>>> getFavtData();
  Future<void> addItemToFav(FavItemModel item);
  Future<void> removeItemfromFav(FavItemModel item);
  Future<void> updateItem(FavItemModel item, bool liked);
}
