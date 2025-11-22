import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';

class GetUserDataUseCase {
  final AuthRepo repo;

  GetUserDataUseCase(this.repo);

  Future<Either<Exception, UserModel>> call() async {
    print('get user data use case');
    return await repo.getUserData();
  }
}
