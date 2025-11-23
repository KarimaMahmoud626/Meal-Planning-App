import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/repos/grocerry_items_repo_impl.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';

part 'grocerry_items_state.dart';

class GrocerryItemsCubit extends Cubit<GrocerryItemsState> {
  final repo = FetchGrocerryItemsRepoImpl(FirebaseFirestore.instance);

  GrocerryItemsCubit() : super(GrocerryItemsLoading());

  Future<void> getGrocerryItems(String category) async {
    final result = await repo.getGrocerryData(category);

    result.fold(
      (error) => emit(GrocerryItemsError(error.toString())),
      (items) => emit(GrocerryItemsLoaded(items)),
    );
  }

  Future<void> toggleLike(String itemId, bool newValue) async {
    await repo.updateLikedState(itemId, newValue);
  }
}
