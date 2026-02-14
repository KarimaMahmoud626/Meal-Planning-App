import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/core/constants/constants.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Exception, UserModel>> compeleteInformation({
    String? gender,
    num? height,
    num? weight,
    num? age,
    num? calorie,
  }) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final uid = currentUser.uid;
      CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );

      await users.doc(uid).set({
        kAge: age,
        kGender: gender,
        kHeight: height,
        kWeight: weight,
        kNeededCalories: calorie,
      }, SetOptions(merge: true));

      final doc = await users.doc(uid).get();

      if (!doc.exists && doc.data() == null) {
        return Left(Exception('user does not exist'));
      }

      final userModel = UserModel.fromJson(doc.data() as Map<String, dynamic>);
      return Right(userModel);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithFacebook() async {
    // Trigger the sign-in flow
    print('entering facebook sign in');
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      print('compelete faceook sign in');

      // Once signed in, return the UserCredential
      return Right(
        await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        ),
      );
    } catch (e) {
      return Left(Exception('Something went wrong'));
    }
  }

  @override
  Future<Either<Exception, UserCredential>> loginWithGoogle() async {
    // Trigger the authentication flow
    print('entering google sign in');
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      print('compelete google sign in');
      // Once signed in, return the UserCredential
      return Right(
        await FirebaseAuth.instance.signInWithCredential(credential),
      );
    } catch (e) {
      print('google error');
      print(e);
      return Left(Exception('Something went wrong while google sign in'));
    }
  }

  @override
  Future<Either<Exception, UserModel>> getUserData() async {
    print('repo_impl');
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return Left(Exception('No user logged in'));
      }
      final doc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(currentUser.uid)
              .get();

      if (!doc.exists || doc.data() == null) {
        return Left(Exception('User data not found'));
      }
      print('user data got');
      final user = UserModel.fromJson(doc.data()!);
      print('user data ready');
      return Right(user);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<UserModel> addNewUser(UserCredential userCred) async {
    try {
      final user = userCred.user;
      final isNew = userCred.additionalUserInfo?.isNewUser ?? false;
      final email = user!.email;
      final uid = user.uid;
      final userModel = UserModel(email: email, name: user.displayName);
      if (isNew) {
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          kEmail: email,
          kName: user.displayName,
          kAge: 0,
          kHeight: 0,
          kWeight: 0,
          kGender: '',
          'createdAt': FieldValue.serverTimestamp(),
        });
        return userModel;
      }
    } catch (e) {
      throw Exception(e);
    }
    return UserModel(email: '');
  }
}
