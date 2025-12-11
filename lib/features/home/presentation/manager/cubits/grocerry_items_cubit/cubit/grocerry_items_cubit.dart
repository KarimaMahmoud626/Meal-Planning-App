import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/features/home/data/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/domain/repos/grocerry_items_repo.dart';
part 'grocerry_items_state.dart';

class GrocerryItemsCubit extends Cubit<GrocerryItemsState> {
  final GrocerryItemsRepo repo;

  GrocerryItemsCubit({required this.repo}) : super(GrocerryItemsLoading());

  Future<void> getGrocerryItems(String category) async {
    try {
      emit(GrocerryItemsLoading());
      final result = await repo.getGrocerryData(category);

      result.fold(
        (error) => emit(GrocerryItemsError(error.toString())),
        (items) => emit(GrocerryItemsLoaded(items)),
      );
    } catch (e) {
      Exception(e);
    }
  }

  Future<void> toggleLike(String itemId, bool newValue) async {
    await repo.updateLikedState(itemId, newValue);
  }
}
