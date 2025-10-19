import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/repos/cart_repo_impl.dart';
import 'package:meal_planning_app/features/home/domain/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final repo = CartRepoImpl(FirebaseFirestore.instance);

  CartCubit() : super(CartLoading());

  Future<void> getCartItems() async {
    final result = await repo.getCartData();

    result.fold((error) => emit(CartError(errorMessage: error.toString())), (
      items,
    ) {
      if (items.isEmpty) {
        emit(CartEmpty());
      } else {
        emit(CartLoaded(items));
      }
    });
  }

  Future<void> addItem(GrocerryItemModel item) async {
    try {
      emit(CartLoading());
      final cartItem = CartItemModel.fromGrocerryItem(item);
      await repo.addItemToCart(cartItem);
      // emit(CartItemAdded());
      await getCartItems();
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }

  Future<void> addItemfromFav(FavItemModel item) async {
    try {
      emit(CartLoading());
      final cartItem = CartItemModel.fromFavItem(item);
      await repo.addItemToCart(cartItem);
      // emit(CartItemAdded());
      await getCartItems();
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }

  Future<void> removeItem(CartItemModel item) async {
    try {
      emit(CartLoading());
      await repo.removeItemfromCart(item);
      await getCartItems();
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }

  Future<void> updateItem(CartItemModel item, num quantity) async {
    try {
      await repo.updateItem(item, quantity);
      await getCartItems();
    } catch (e) {
      emit(CartError(errorMessage: e.toString()));
    }
  }
}
