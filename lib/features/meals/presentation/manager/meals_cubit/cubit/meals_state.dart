part of 'meals_cubit.dart';

sealed class MealsState extends Equatable {
  const MealsState();

  @override
  List<Object> get props => [];
}

class MealsLoading extends MealsState {}

class MealsLoaded extends MealsState {
  final List<MealModel> meals;

  const MealsLoaded(this.meals);

  @override
  List<Object> get props => [meals];
}

class MealDataLoaded extends MealsState {
  final MealModel meal;

  const MealDataLoaded(this.meal);

  @override
  List<Object> get props => [meal];
}

class MealsError extends MealsState {
  final String errorMessage;

  const MealsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class MealsEmpty extends MealsState {}
