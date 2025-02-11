part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  final String message;
  RegisterError({required this.message});
}

class LoginLoading extends RegisterState {}

class LoginSuccess extends RegisterState {}

class LoginError extends RegisterState {
  final String message;
  LoginError({required this.message});
}


