import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/entities/user_profile.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/add_new_user_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/calculate_calorie_usecase.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/compelete_info_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/get_user_data_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_facebook_use_case.dart';
import 'package:meal_planning_app/features/Auth/domain/usecases/login_with_google_use_case.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginWithGoogleUseCase? loginWithGoogleUseCase;
  final LoginWithFacebookUseCase? loginWithFacebookUseCase;
  final CompeleteInfoUseCase? completeInformationUseCase;
  final GetUserDataUseCase? getUserDataUseCase;
  final AddNewUserUsecase? addNewUserUsecase;
  final CalculateCalorieUsecase? calculateCalorieUsecase;

  AuthCubit({
    this.calculateCalorieUsecase,
    this.addNewUserUsecase,
    this.loginWithGoogleUseCase,
    this.loginWithFacebookUseCase,
    this.completeInformationUseCase,
    this.getUserDataUseCase,
  }) : super(AuthInitial());

  Future<void> loginWithGoogle() async {
    try {
      emit(AuthLoading());
      print('auth loading');
      final cred = await loginWithGoogleUseCase!.call();
      cred.fold(
        (ex) {
          print('user cred exception: $ex');
          emit(AuthFailure(ex.toString()));
        },
        (userCred) async {
          print('got cred');

          UserModel userModel;
          if (userCred.additionalUserInfo!.isNewUser) {
            userModel = await addNewUserUsecase!.call(userCred);
          } else {
            final res = await getUserDataUseCase!.call();
            userModel = res.fold(
              (l) => UserModel(email: userCred.user!.email),
              (r) => r,
            );
          }

          emit(
            LoginWithGoogleSuccess(
              userModel,
              isNew: userCred.additionalUserInfo!.isNewUser,
            ),
          );
          print('auth success');
        },
      );
    } catch (e, st) {
      print('loginWithGoogle error: $e\n$st');
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> loginWithFacebook() async {
    emit(AuthLoading());
    final result = await loginWithFacebookUseCase!.call();
    result.fold(
      (l) => emit(AuthFailure(l.toString())),
      (r) => emit(AuthSuccess()),
    );
  }

  Future<void> compeleteInformation({
    String? gender,
    num? height,
    num? weight,
    num? age,
  }) async {
    emit(AuthLoading());
    final calorie = calculateCalorieUsecase!.execute(
      profile: UserProfileEntity(
        gender: gender ?? '',
        height: height ?? 0,
        weight: weight ?? 0,
        age: age ?? 0,
      ),
    );
    final result = await completeInformationUseCase!.call(
      gender: gender,
      height: height,
      weight: weight,
      age: age,
      calorie: calorie,
    );
    result.fold(
      (l) => emit(AuthFailure(l.toString())),
      (r) => emit(CompeleteInfoSuccess(r)),
    );
  }

  Future<void> getUserData() async {
    print('cubit');
    emit(AuthLoading());
    final result = await getUserDataUseCase!.call();
    result.fold((failure) {
      emit(AuthFailure(failure.toString()));
      print(failure.toString());
    }, (user) => emit(GetUserDataSuccess(user)));
  }
}
