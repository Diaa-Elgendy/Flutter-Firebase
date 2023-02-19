part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginFailedState extends AuthState {
  String error;

  LoginFailedState(this.error) {
    print(error);
  }
}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {}

class RegisterFailedState extends AuthState {
  String error;

  RegisterFailedState(this.error) {
    print(error);
  }
}

class CreateUserLoadingState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserFailedState extends AuthState {
  String error;

  CreateUserFailedState(this.error) {
    print(error);
  }
}
