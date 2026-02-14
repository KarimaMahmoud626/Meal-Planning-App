import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/home/data/models/cart_item_model.dart';
import 'package:meal_planning_app/features/home/domain/repos/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Future<Either<Exception, List<CartItemModel>>> getCartData() async {
    try {
      final snapshot =
          await firestore
              .collection('users')
              .doc(user!.uid)
              .collection('cart')
              .get();
      final items =
          snapshot.docs.map((doc) => CartItemModel.fromFirestore(doc)).toList();
      return Right(items);
    } on FirebaseException catch (e) {
      return Left(Exception('Firebase error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<void> addItemToCart(CartItemModel item) async {
    await firestore
        .collection('users')
        .doc(user!.uid)
        .collection('cart')
        .add(item.toFirestore());
  }

  @override
  Future<void> removeItemfromCart(CartItemModel item) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('cart')
            .where(kName, isEqualTo: item.name)
            .get();

    for (var doc in query.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> removeAll() async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('cart')
            .get();

    for (var doc in query.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> updateItem(CartItemModel item, num quantity) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('cart')
            .where(kName, isEqualTo: item.name)
            .get();

    if (query.docs.isNotEmpty) {
      for (var doc in query.docs) {
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('cart')
            .doc(doc.id)
            .update({kQuantity: quantity});
      }
    } else {
      await firestore
          .collection('users')
          .doc(user!.uid)
          .collection('cart')
          .add(item.toFirestore());
    }
  }
}
