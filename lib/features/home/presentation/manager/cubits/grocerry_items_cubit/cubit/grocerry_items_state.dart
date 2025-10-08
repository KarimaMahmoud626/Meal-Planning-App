part of 'grocerry_items_cubit.dart';

sealed class GrocerryItemsState extends Equatable {
  const GrocerryItemsState();

  @override
  List<Object> get props => [];
}

class GrocerryItemsLoading extends GrocerryItemsState {
  const GrocerryItemsLoading();
}

class GrocerryItemsLoaded extends GrocerryItemsState {
  final List<GrocerryItemModel> items;

  const GrocerryItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class GrocerryItemsError extends GrocerryItemsState {
  final String errorMessage;

  const GrocerryItemsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
