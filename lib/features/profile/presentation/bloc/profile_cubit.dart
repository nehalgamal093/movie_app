import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/failures/failures.dart';
import 'package:movies_app/features/profile/data/models/reset_password_request.dart';
import 'package:movies_app/features/profile/data/models/user_model.dart';
import 'package:movies_app/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:movies_app/features/profile/domain/usecases/wishlist_usecase.dart';
import '../../data/models/edit_profile_request.dart';
import '../../data/models/wishlist_model.dart';
import '../../domain/usecases/deleting_account_usecase.dart';
import '../../domain/usecases/reset_password_usecase.dart';
import '../../domain/usecases/user_usecase.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  UserUseCase getUserUseCase;
  WishlistUseCase wishlistUseCase;
  UserModel? userModel;
  UpdateProfileUseCase updateProfileUseCase;
  ResetPasswordUseCase resetPasswordUseCase;
  DeletingAccountUseCase deleteAccountUseCase;
  ProfileCubit(
      this.getUserUseCase,
      this.wishlistUseCase,
      this.updateProfileUseCase,
      this.resetPasswordUseCase,
      this.deleteAccountUseCase)
      : super(UserInitial());

  int? currentAvatarId;

  void updateAvatar(int id) {
    currentAvatarId = id;
  }

  Future<void> getUser() async {
    emit(UserLoading());
    var result = await getUserUseCase.call();
    result.fold((l) {
      emit(
        UserError(failures: l),
      );
    }, (r) {
      userModel = r;
      emit(
        UserSuccess(user: r),
      );
    });
  }

  Future<void> getWishlist() async {
    emit(WishlistLoading());
    var result = await wishlistUseCase.call();
    result.fold((l) {
      emit(
        WishlistError(failures: l),
      );
    }, (r) {
      emit(
        WishlistSuccess(wishlist: r),
      );
    });
  }

  Future<void> updateProfile(EditProfileRequest? request) async {
    emit(EditProfileLoading());
    var result = await updateProfileUseCase.call(request: request);
    result.fold((l) {
      emit(
        EditProfileError(failures: l),
      );
    }, (r) {
      emit(
        EditProfileSuccess(message: r),
      );
    });
  }

  Future<void> resetPassword(ResetPasswordRequest? request) async {
    emit(ResetPasswordLoading());
    var result = await resetPasswordUseCase.call(request: request);
    result.fold((l) {
      emit(
        ResetPasswordError(failures: l),
      );
    }, (r) {
      emit(
        ResetPasswordSuccess(message: r),
      );
    });
  }
  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());
    var result = await deleteAccountUseCase.call();
    result.fold((l) {
      emit(
        DeleteAccountError(failures: l),
      );
    }, (r) {
      emit(
        DeleteAccountSuccess(message: r),
      );
    });
  }
}
