import 'package:bloc/bloc.dart';
import 'package:movies_app/caching/cache_helper.dart';
import 'package:movies_app/models/login_response.dart';
import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/user_model.dart';
import 'package:movies_app/repository/auth_repo/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterResponse? registerResponse;
  LoginResponse? loginResponse;

  AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  String emailLogin = "";
  String passwordLogin = "";
  UserModel userModel = UserModel.init();

  void updateAvatarId(int avatarId){
    userModel.avatarId = avatarId;
  }
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

  void updateEmailLogin(String emailLogin) {
    this.emailLogin = emailLogin;
  }

  void updatePasswordLogin(String passwordLogin) {
    this.passwordLogin = passwordLogin;
  }

  void register() async {
    try {
      emit(RegisterLoading());
      registerResponse = await authRepo.register(userModel);
      if (registerResponse!.message![0] == 'User created successfully') {
        emit(RegisterSuccess());
      } else {
        emit(RegisterError(message: registerResponse!.message![0]));
      }
    } catch (error) {
      emit(RegisterError(message: error.toString()));
    }
  }

  void login() async {
    try {
      emit(LoginLoading());
      loginResponse = await authRepo.login(emailLogin, passwordLogin);
      if (loginResponse!.message![0] == 'Success Login') {
        CacheHelper.saveToken(loginResponse!.data!);
        emit(LoginSuccess());
      } else {
        emit(LoginError(message: loginResponse!.message![0]));
      }
    } catch (error) {
      emit(LoginError(message: error.toString()));
    }
  }

}
