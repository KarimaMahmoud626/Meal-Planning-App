import 'package:meal_planning_app/features/Auth/data/models/user_model.dart';

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class LoginWithGoogleSuccess extends AuthState {
  final UserModel user;
  bool? isNew;

  LoginWithGoogleSuccess(this.user, {this.isNew = false});
}

class LoginWithFacebookSuccess extends AuthState {}

class CompeleteInfoSuccess extends AuthState {
  final UserModel user;

  CompeleteInfoSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String? message;

  AuthFailure(this.message);
}

class GetUserDataSuccess extends AuthState {
  final UserModel user;

  GetUserDataSuccess(this.user);
}
