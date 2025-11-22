import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';

class LoginWithGoogleUseCase {
  final AuthRepo repo;

  LoginWithGoogleUseCase(this.repo);

  Future<Either<Exception, UserCredential>> call() async {
    return await repo.loginWithGoogle();
  }
}
