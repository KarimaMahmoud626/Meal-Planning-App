import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/repos/fav_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';

part 'favorite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavLoading());
  final repo = FavRepoImpl(FirebaseFirestore.instance);

  Future<void> getFavItems() async {
    final result = await repo.getFavtData();

    result.fold((error) => emit(FavError(errorMessage: error.toString())), (
      items,
    ) {
      if (items.isEmpty) {
        emit(FavEmpty());
      } else {
        emit(FavLoaded(items));
      }
    });
  }

  Future<void> addItem(GrocerryItemModel item) async {
    try {
      emit(FavLoading());
      final favItem = FavItemModel.fromGrocerryItem(item);
      await repo.addItemToFav(favItem);
      // emit(CartItemAdded());
      await getFavItems();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
    }
  }

  Future<void> removeItem(FavItemModel item) async {
    try {
      emit(FavLoading());
      await repo.removeItemfromFav(item);
      await getFavItems();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
    }
  }

  Future<void> updateItem(FavItemModel item, bool liked) async {
    try {
      await repo.updateItem(item, liked);
      await getFavItems();
    } catch (e) {
      emit(FavError(errorMessage: e.toString()));
    }
  }
}
