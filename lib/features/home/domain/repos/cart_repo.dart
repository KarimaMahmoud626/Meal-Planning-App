import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/domain/models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<Exception, List<CartItemModel>>> getCartData();
  Future<void> addItemToCart(CartItemModel item);
  Future<void> removeItemfromCart(CartItemModel item);
  Future<void> updateItem(CartItemModel item, num quantity);
}
