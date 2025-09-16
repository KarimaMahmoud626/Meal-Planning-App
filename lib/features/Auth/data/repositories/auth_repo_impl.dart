import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/Auth/domain/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositiories/auth_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Exception, UserModel>> compeleteInformation({
    String? name,
    String? phoneNumber,
    String? address,
    UserModel? user,
  }) async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser!;
      final uid = currentUser.uid;
      final email = currentUser.email;
      CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );
      UserModel userModel = UserModel(
        email: email!,
        name: name,
        phoneNumber: phoneNumber,
        address: address,
      );

      await users.doc(uid).set(userModel.toJson());

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
    try {
      print('entering google sign in');
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
      return Left(Exception('Something went wrong while google sign in'));
    }
  }
}
