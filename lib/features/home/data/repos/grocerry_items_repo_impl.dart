import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/home/domain/models/grocerry_item_model.dart';
import 'package:meal_planning_app/features/home/domain/repos/grocerry_items_repo.dart';

class FetchGrocerryItemsRepoImpl extends GrocerryItemsRepo {
  final FirebaseFirestore firestore;

  FetchGrocerryItemsRepoImpl(this.firestore);
  @override
  Future<Either<Exception, List<GrocerryItemModel>>> getGrocerryData(
    String category,
  ) async {
    try {
      final snapshot =
          await firestore
              .collection('grocerry_items')
              .where('category', isEqualTo: category.toLowerCase())
              .get();
      final items =
          snapshot.docs
              .map((doc) => GrocerryItemModel.fromFirestore(doc))
              .toList();
      return Right(items);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<void> updateLikedState(String id, bool liked) async {
    await firestore.collection('grocerry_items').doc(id).update({
      'liked': liked,
    });
  }
}
