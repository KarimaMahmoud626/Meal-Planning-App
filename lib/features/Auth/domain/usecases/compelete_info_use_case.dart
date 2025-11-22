import 'package:dartz/dartz.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositories/auth_repo.dart';

class CompeleteInfoUseCase {
  final AuthRepo repo;

  CompeleteInfoUseCase(this.repo);

  Future<Either<Exception, UserModel>> call({
    String? gender,
    num? height,
    num? weight,
    num? age,
    num? calorie,
  }) async {
    return await repo.compeleteInformation(
      gender: gender,
      height: height,
      weight: weight,
      age: age,
      calorie: calorie,
    );
  }
}
