import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Exception, UserCredential>> loginWithGoogle();
  Future<Either<Exception, UserCredential>> loginWithFacebook();
  Future<Either<Exception, UserModel>> compeleteInformation({
    String? gender,
    num? height,
    num? weight,
    num? age,
    num? calorie,
  });
  Future<Either<Exception, UserModel>> getUserData();
  Future<UserModel> addNewUser(UserCredential userCred);
}
