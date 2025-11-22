import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';

class AddNewUserUsecase {
  final AuthRepo repo;

  AddNewUserUsecase({required this.repo});

  Future<UserModel> call(UserCredential userCred) async {
    return await repo.addNewUser(userCred);
  }
}
