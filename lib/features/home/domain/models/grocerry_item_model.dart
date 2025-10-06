import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_planning_app/core/constants.dart';

class GrocerryItemModel {
  final String? name;
  final Float? price;
  final String? imageUrl;
  final bool? liked;
  final String? category;
  final String? description;

  GrocerryItemModel({
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
}
