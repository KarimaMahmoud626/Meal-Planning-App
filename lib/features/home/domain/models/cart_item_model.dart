import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/home/domain/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';

class CartItemModel extends Equatable {
  final String? id;
  final String? name;
  final num? price;
  final String? imageUrl;
  final num? quantity;

  const CartItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity,
  });

  factory CartItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CartItemModel(
      name: data[kName],
      price: data[kPrice],
      imageUrl: data[kImageUrl],
      quantity: data[kQuantity],
    );
  }

  Map<String, dynamic> toFirestore() {
    final data = <String, dynamic>{
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kQuantity: quantity,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  factory CartItemModel.fromGrocerryItem(GrocerryItemModel item) {
    return CartItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      imageUrl: item.imageUrl,
      quantity: 1,
    );
  }

  factory CartItemModel.fromFavItem(FavItemModel item) {
    return CartItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      imageUrl: item.imageUrl,
      quantity: 1,
    );
  }

  toJson() {
    return {
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kQuantity: quantity,
    };
  }

  @override
  List<Object?> get props => [name, price, imageUrl, quantity];
}
