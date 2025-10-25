import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/core/constants.dart';
import 'package:meal_planning_app/features/meals/domain/models/fav_meal_model.dart';
import 'package:meal_planning_app/features/meals/domain/repos/fav_meal_repo.dart';

class FavMealRepoImpl extends FavMealRepo {
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  @override
  Future<void> addMealToFav(FavMealModel meal) async {
    print('Adding meal to Firestore: ${meal.mealName}');
    await firestore
        .collection('users')
        .doc(user!.uid)
        .collection('fav_meals')
        .add(meal.toFirestore());
  }

  @override
  Future<Either<Exception, List<FavMealModel>>> getFavMealData() async {
    try {
      final snapshot =
          await firestore
              .collection('users')
              .doc(user!.uid)
              .collection('fav_meals')
              .get();
      final items =
          snapshot.docs.map((doc) => FavMealModel.fromFirestore(doc)).toList();
      return Right(items);
    } on FirebaseException catch (e) {
      return Left(Exception('Firebase error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<void> removeMealfromFav(FavMealModel meal) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav_meals')
            .where(kMealName, isEqualTo: meal.mealName)
            .get();

    for (var doc in query.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> updateMeal(FavMealModel item, bool liked) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav_meals')
            .where(kMealName, isEqualTo: item.mealName)
            .get();

    if (query.docs.isNotEmpty) {
      for (var doc in query.docs) {
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav_meals')
            .doc(doc.id)
            .update({kLiked: liked});
      }
    } else {
      await firestore
          .collection('users')
          .doc(user!.uid)
          .collection('fav_meals')
          .add(item.toFirestore());
    }
  }
}
