part of 'favorite_cubit.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();

  @override
  List<Object> get props => [];
}

final class FavLoading extends FavouriteState {}

class FavEmpty extends FavouriteState {}

class FavLoaded extends FavouriteState {
  final List<FavItemModel> items;

  const FavLoaded(this.items);

  FavLoaded copyWith({List<FavItemModel>? items}) {
    return FavLoaded(items ?? this.items);
  }

  @override
  List<Object> get props => [items];
}

class FavError extends FavouriteState {
  final String errorMessage;

  const FavError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class FavItemAdded extends FavouriteState {}
