import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_planning_app/core/constants.dart';

class GrocerryItemModel extends Equatable {
  final String? id;
  final String? name;
  final num? price;
  final String? imageUrl;
  final bool? liked;
  final String? category;
  final String? description;

  const GrocerryItemModel({
    this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.liked,
    required this.category,
    this.description,
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
    );
  }

  toJson() {
    return {
      kName: name,
      kPrice: price,
      kImageUrl: imageUrl,
      kLiked: liked,
      kCategory: category,
      kDescription: description,
    };
  }

  @override
  List<Object?> get props => [
    name,
    price,
    imageUrl,
    liked,
    category,
    description,
  ];
}
