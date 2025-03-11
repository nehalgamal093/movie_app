// import 'package:bloc/bloc.dart';
// import 'package:movies_app/models/profile_update_response.dart';
// import 'package:movies_app/repository/profile_repo/profile_repo.dart';
// import '../../models/register_response.dart';
// import '../../models/reset_password_response.dart';
// part 'profile_state.dart';
//
// class ProfileCubit extends Cubit<ProfileState> {
//   ResetPasswordResponse? resetPasswordResponse;
//   RegisterResponse? registerResponse;
//   ProfileUpdateResponse? profileUpdateResponse;
//   ProfileRepo profileRepo;
//   ProfileCubit(this.profileRepo) : super(ProfileInitial());
//   String oldPassword = "";
//   String newPassword = "";
//   String newEmail = "";
//   int newId = 0;
//   void updateOldPassword(String oldPassword) {
//     this.oldPassword = oldPassword;
//   }
//
//   void updateNewPassword(String newPassword) {
//     this.newPassword = newPassword;
//   }
//
//   void updateNewEmail(String newEmail) {
//     this.newEmail = newEmail;
//   }
//
//   void updateNewAvatar(int id) {
//     newId = id;
//     emit(ChangeAvatarSuccess());
//   }
//
//   void resetPassword() async {
//     try {
//       emit(ResetPasswordLoading());
//       resetPasswordResponse =
//           await profileRepo.resetPassword(oldPassword, newPassword);
//       if (resetPasswordResponse!.message![0] ==
//           'Password updated successfully') {
//         emit(ResetPasswordSuccess());
//       } else {
//         emit(ResetPasswordError(message: resetPasswordResponse!.message![0]));
//       }
//     } catch (error) {
//       emit(ResetPasswordError(message: error.toString()));
//     }
//   }
//
//   void getProfile() async {
//     try {
//       emit(ProfileLoading());
//       registerResponse = await profileRepo.getProfile();
//       if (registerResponse!.message![0] == 'Profile fetched successfully') {
//         updateNewAvatar(registerResponse!.data!.avaterId!.toInt());
//         emit(ProfileSuccess());
//       } else {
//         emit(ProfileError(message: registerResponse!.message![0]));
//       }
//     } catch (error) {
//       print(error);
//       emit(ProfileError(message: error.toString()));
//     }
//   }
//
//   void updateProfile() async {
//     try {
//       emit(ProfileLoading());
//       profileUpdateResponse = await profileRepo.updateProfile(newEmail, newId);
//       if (profileUpdateResponse!.message![0] ==
//           'Profile updated successfully') {
//         getProfile();
//         emit(UpdateProfileSuccess());
//       } else {
//         emit(
//           UpdateProfileError(message: profileUpdateResponse!.message![0]),
//         );
//       }
//     } catch (error) {
//       emit(
//         UpdateProfileError(
//           message: error.toString(),
//         ),
//       );
//     }
//   }
//
//   void deleteAccount() async {
//     try {
//       emit(ProfileDeletedLoading());
//       profileUpdateResponse = await profileRepo.deleteAccount();
//       if (profileUpdateResponse!.message![0] ==
//           'Profile deleted successfully') {
//         emit(ProfileDeletedSuccess());
//       } else {
//         emit(
//           ProfileDeletedError(message: profileUpdateResponse!.message![0]),
//         );
//       }
//     } catch (error) {
//       emit(
//         ProfileDeletedError(
//           message: error.toString(),
//         ),
//       );
//     }
//   }
// }
