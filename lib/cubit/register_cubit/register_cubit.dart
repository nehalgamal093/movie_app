import 'package:bloc/bloc.dart';
import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/repository/auth_repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterResponse? registerResponse;
  AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  UserModel userModel = UserModel.init();
  void updateName(String name) {
    userModel.name = name;
  }

  void updateEmail(String email) {
    userModel.email = email;
  }

  void updatePassword(String password) {
    userModel.password = password;
  }

  void updateConfirmPassword(String confirmPassword) {
    userModel.confirmPassword = confirmPassword;
  }

  void updatePhone(String phone) {
    userModel.phone = phone;
  }

  void register() async {
    try {
      emit(RegisterLoading());
      registerResponse = await authRepo.register(userModel);
      if (registerResponse!.message == 'User created successfully') {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(message: registerResponse!.message![0]));
      }
    } catch (error) {
      emit(RegisterError(message: error.toString()));
    }
  }
}
