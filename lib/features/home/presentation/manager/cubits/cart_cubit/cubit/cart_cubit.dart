import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/data/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/domain/repos/cart_repo.dart';
import 'package:meal_planning_app/features/home/domain/usecases/calculate_cart_calorie_and_price_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo repo;
  final CalculateCartCalorieAndPriceUseCase? calculateCalorieAndPriceUsecase;

  CartCubit({required this.repo, this.calculateCalorieAndPriceUsecase})
    : super(CartLoading());

  Future<void> getCartItems() async {
    // emit(CartLoading());
    final result = await repo.getCartData();

    result.fold((error) => emit(CartError(errorMessage: error.toString())), (
      items,
    ) {
      if (items.isEmpty) {
        emit(CartEmpty());
      } else {
        final calorieList = items.map((item) => item.calories).toList();
        final priceList = items.map((item) => item.price).toList();
        final quantityList = items.map((item) => item.quantity).toList();
        final caloriesSum = calculateCalorieAndPriceUsecase!.calcCalories(
          caloriesList: calorieList,
          quantity: quantityList,
        );

        emit(
          CartLoaded(
            items: items,
            totalCalories: caloriesSum,
            totalPrice: calculateCalorieAndPriceUsecase!.calcPrice(
              pricessList: priceList,
              quantity: quantityList,
            ),
          ),
        );
      }
    });
  }

  Future<void> addItem(GrocerryItemModel item) async {
    try {
      emit(CartLoading());
      final cartItem = CartItemModel.fromGrocerryItem(item);
      await repo.addItemToCart(cartItem);
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

  Future<void> removeAll() async {
    try {
      await repo.removeAll();
      emit(CartEmpty());
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
