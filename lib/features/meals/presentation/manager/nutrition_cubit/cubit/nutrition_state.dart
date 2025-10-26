part of 'nutrition_cubit.dart';

sealed class NutritionState extends Equatable {
  const NutritionState();

  @override
  List<Object> get props => [];
}

class NutritionLoading extends NutritionState {}

class NutritionLoaded extends NutritionState {
  final List<NutritionResponseModel> nutrients;

  const NutritionLoaded(this.nutrients);

  @override
  List<Object> get props => [nutrients];
}

class NutritionError extends NutritionState {
  final String errorMessage;

  const NutritionError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NutritionEmpty extends NutritionState {}
