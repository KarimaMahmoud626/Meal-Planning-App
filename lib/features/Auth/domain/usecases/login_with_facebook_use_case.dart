import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';

class LoginWithFacebookUseCase {
  final AuthRepo repo;

  LoginWithFacebookUseCase(this.repo);

  Future<Either<Exception, UserCredential>> call() async {
    return await repo.loginWithFacebook();
  }
}
