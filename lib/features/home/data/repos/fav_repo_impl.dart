import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/home/data/models/fav_item_model.dart';
import 'package:meal_planning_app/features/home/domain/repos/fav_repo.dart';

class FavRepoImpl extends FavRepo {
  final FirebaseFirestore firestore;
  final user = FirebaseAuth.instance.currentUser;

  FavRepoImpl(this.firestore);
  @override
  Future<void> addItemToFav(FavItemModel item) async {
    await firestore
        .collection('users')
        .doc(user!.uid)
        .collection('fav')
        .add(item.toFirestore());
  }

  @override
  Future<Either<Exception, List<FavItemModel>>> getFavtData() async {
    try {
      final snapshot =
          await firestore
              .collection('users')
              .doc(user!.uid)
              .collection('fav')
              .get();
      final items =
          snapshot.docs.map((doc) => FavItemModel.fromFirestore(doc)).toList();
      return Right(items);
    } on FirebaseException catch (e) {
      return Left(Exception('Firebase error: ${e.message}'));
    } catch (e) {
      return Left(Exception('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<void> removeItemfromFav(FavItemModel item) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav')
            .where(kName, isEqualTo: item.name)
            .get();

    for (var doc in query.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<void> updateItem(FavItemModel item, bool liked) async {
    final query =
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav')
            .where(kName, isEqualTo: item.name)
            .get();

    if (query.docs.isNotEmpty) {
      for (var doc in query.docs) {
        await firestore
            .collection('users')
            .doc(user!.uid)
            .collection('fav')
            .doc(doc.id)
            .update({kLiked: liked});
      }
    } else {
      await firestore
          .collection('users')
          .doc(user!.uid)
          .collection('fav')
          .add(item.toFirestore());
    }
  }
}
