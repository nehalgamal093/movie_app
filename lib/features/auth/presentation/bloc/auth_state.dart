part of 'auth_cubit.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  AuthModel authModel;
  RegisterSuccessState({required this.authModel});
}

class RegisterFailedState extends AuthState {
  String failures;
  RegisterFailedState({required this.failures});
}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginModel loginModel;
  LoginSuccessState({required this.loginModel});
}

class LoginFailedState extends AuthState {
  String failures;
  LoginFailedState({required this.failures});
}
