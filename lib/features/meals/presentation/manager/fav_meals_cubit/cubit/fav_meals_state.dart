part of 'fav_meals_cubit.dart';

sealed class FavMealsState extends Equatable {
  const FavMealsState();

  @override
  List<Object> get props => [];
}

final class FavMealsLoading extends FavMealsState {}

class FavMealsLoaded extends FavMealsState {
  final List<FavMealModel> items;

  const FavMealsLoaded(this.items);

  FavMealsLoaded copyWith({List<FavMealModel>? items}) {
    return FavMealsLoaded(items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}

class FavError extends FavMealsState {
  final String errorMessage;

  const FavError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class FavMealsEmpty extends FavMealsState {}
