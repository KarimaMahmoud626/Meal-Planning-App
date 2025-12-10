part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState {}

class CartEmpty extends CartState {}

class CartLoaded extends CartState {
  final List<CartItemModel> items;
  final double? totalCalories;
  final double? totalPrice;
  final double? caloriesPercent;

  const CartLoaded({
    required this.items,
    this.totalCalories,
    this.totalPrice,
    this.caloriesPercent,
  });

  CartLoaded copyWith({
    List<CartItemModel>? items,
    double? totalCalories,
    double? totalPrice,
    double? caloriesPercent,
  }) {
    return CartLoaded(
      items: items ?? this.items,
      totalCalories: totalCalories ?? this.totalCalories,
      totalPrice: totalPrice ?? this.totalPrice,
      caloriesPercent: caloriesPercent ?? this.caloriesPercent,
    );
  }

  @override
  List<Object> get props => [items];
}

class CartError extends CartState {
  final String errorMessage;

  const CartError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class CartItemAdded extends CartState {}
