import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants/constants.dart';

class GrocerryItemModel extends Equatable {
  final String? id;
  final String? name;
  final num? price;
  final String? imageUrl;
  final bool? liked;
  final String? category;
  final String? description;
  final num? calories;
  final String? weight;

  const GrocerryItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.liked,
    required this.category,
    this.description,
    this.calories,
    this.weight,
  });

  factory GrocerryItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return GrocerryItemModel(
      id: doc.id,
      name: data[kName],
      price: data[kPrice],
      imageUrl: data[kImageUrl],
      liked: data[kLiked],
      category: data[kCategory],
      description: data[kDescription],
      calories: data[kCalories],
      weight: data[kWeight],
    );
  }

  toJson() {
    return {
      kId: id,
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kLiked: liked,
      kCategory: category,
      kDescription: description,
      kCalories: calories,
      kWeight: weight,
    };
  }

  toCartItem() {
    return {
      kId: id,
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kCalories: calories,
      kWeight: weight,
    };
  }

  toFavItem() {
    return {
      kId: id,
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kLiked: liked,
    };
  }

  @override
  List<Object?> get props => [
    id,
    name,
    price,
    imageUrl,
    liked,
    category,
    description,
    calories,
    weight,
  ];
}
