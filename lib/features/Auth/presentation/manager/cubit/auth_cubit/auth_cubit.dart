import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planning_app/features/Auth/domain/models/user_model.dart';
import 'package:meal_planning_app/features/Auth/domain/repositiories/auth_repo.dart';
import 'package:meal_planning_app/features/Auth/presentation/manager/cubit/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(AuthInitial());

  Future<void> loginWithGoogle() async {
    emit(AuthLoading());
    final result = await _authRepo.loginWithGoogle();
    result.fold(
      (l) => emit(AuthFailure(l.toString())),
      (r) => emit(AuthSuccess()),
    );
  }

  Future<void> loginWithFacebook() async {
    emit(AuthLoading());
    final result = await _authRepo.loginWithFacebook();
    result.fold(
      (l) => emit(AuthFailure(l.toString())),
      (r) => emit(AuthSuccess()),
    );
  }

  Future<void> compeleteInformation(
    UserModel userModel,
    String name,
    String phoneNumber,
    String address,
  ) async {
    emit(AuthLoading());
    final result = await _authRepo.compeleteInformation(
      name: name,
      phoneNumber: phoneNumber,
      address: address,
      user: userModel,
    );
    result.fold(
      (l) => emit(AuthFailure(l.toString())),
      (r) => emit(AuthSuccess()),
    );
  }
}
