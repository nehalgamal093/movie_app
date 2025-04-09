part of 'profile_cubit.dart';

abstract class ProfileState {}

class UserInitial extends ProfileState {}

class UserLoading extends ProfileState {}

class UserSuccess extends ProfileState {
  final UserModel user;
  UserSuccess({required this.user});
}

class UserError extends ProfileState {
  final AppFailures failures;
  UserError({required this.failures});
}

class WishlistLoading extends ProfileState {}

class WishlistSuccess extends ProfileState {
  final WishlistModel wishlist;
  WishlistSuccess({required this.wishlist});
}

class WishlistError extends ProfileState {
  final AppFailures failures;
  WishlistError({required this.failures});
}

class EditProfileLoading extends ProfileState {}

class EditProfileSuccess extends ProfileState {
  final String message;

  EditProfileSuccess({required this.message});
}

class EditProfileError extends ProfileState {
  final AppFailures failures;
  EditProfileError({required this.failures});
}

class ChangeAvatarSuccess extends ProfileState {
  final int id;
  ChangeAvatarSuccess({required this.id});
}

class ResetPasswordLoading extends ProfileState {}

class ResetPasswordSuccess extends ProfileState {
  final String message;

  ResetPasswordSuccess({required this.message});
}

class ResetPasswordError extends ProfileState {
  final AppFailures failures;
  ResetPasswordError({required this.failures});
}
class DeleteAccountLoading extends ProfileState {}

class DeleteAccountSuccess extends ProfileState {
  final String message;

  DeleteAccountSuccess({required this.message});
}

class DeleteAccountError extends ProfileState {
  final AppFailures failures;
  DeleteAccountError({required this.failures});
}