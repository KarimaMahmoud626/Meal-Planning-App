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

  const CartLoaded(this.items);

  CartLoaded copyWith({List<CartItemModel>? items}) {
    return CartLoaded(items ?? this.items);
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
