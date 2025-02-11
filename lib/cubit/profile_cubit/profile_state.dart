part of 'profile_cubit.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileLoading extends ProfileState {}
class ProfileSuccess extends ProfileState {}
class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}
class UpdateProfileLoading extends ProfileState {}
class UpdateProfileSuccess extends ProfileState {}
class UpdateProfileError extends ProfileState {
  final String message;
  UpdateProfileError({required this.message});
}
class ResetPasswordLoading extends ProfileState {}

class ResetPasswordSuccess extends ProfileState {}

class ResetPasswordError extends ProfileState {
  final String message;
  ResetPasswordError({required this.message});
}
class ChangeAvatarSuccess extends ProfileState {}
class ProfileDeletedLoading extends ProfileState {}
class ProfileDeletedSuccess extends ProfileState {}
class ProfileDeletedError extends ProfileState {
  final String message;
  ProfileDeletedError({required this.message});
}
