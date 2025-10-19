import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';

class FavItemModel extends Equatable {
  final String? id;
  final String? name;
  final num? price;
  final String? imageUrl;
  final num? quantity;
  final bool liked;

  const FavItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity,
    required this.liked,
  });

  factory FavItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FavItemModel(
      name: data[kName],
      price: data[kPrice],
      imageUrl: data[kImageUrl],
      quantity: data[kQuantity],
      liked: data[kLiked],
    );
  }

  Map<String, dynamic> toFirestore() {
    final data = <String, dynamic>{
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kQuantity: quantity,
      kLiked: liked,
    };

    data.removeWhere((key, value) => value == null);
    return data;
  }

  toCartItem() {
    return {kId: id, kName: name, kPrice: price, kImageUrl: imageUrl};
  }

  factory FavItemModel.fromGrocerryItem(GrocerryItemModel item) {
    return FavItemModel(
      id: item.id,
      name: item.name,
      price: item.price,
      imageUrl: item.imageUrl,
      quantity: 1,
      liked: item.liked!,
    );
  }
  toJson() {
    return {
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kQuantity: quantity,
      kLiked: liked,
    };
  }

  @override
  List<Object?> get props => [name, price, imageUrl, quantity, liked];
}
