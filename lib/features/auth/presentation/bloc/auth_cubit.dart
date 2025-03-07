import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/login_model.dart';
import 'package:movies_app/features/auth/data/models/register_request_model.dart';
import 'package:movies_app/features/auth/domain/usecases/register_usecase.dart';
import '../../../../caching/cache_helper.dart';
import '../../domain/usecases/login_usecase.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  AuthCubit(this.registerUseCase, this.loginUseCase) : super(AuthInitial());
  int avatarId = 0;
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String phone = "";
  String loginEmail = "";
  String loginPassword = "";
  void updateAvatarId(int avatarId) {
    this.avatarId = avatarId;
  }

  void updateName(String name) {
    this.name = name;
  }

  void updateEmail(String email) {
    this.email = email;
  }

  void updatePassword(String password) {
    this.password = password;
  }

  void updateConfirmPassword(String confirmPassword) {
    this.confirmPassword = confirmPassword;
  }

  void updatePhone(String phone) {
    this.phone = phone;
  }

  void updateLoginEmail(String loginEmail) {
    this.loginEmail = loginEmail;
  }

  void updateLoginPassword(String loginPassword) {
    this.loginPassword = loginPassword;
  }

  void register() async {
    emit(RegisterLoadingState());
    RegisterRequestModel requestModel = RegisterRequestModel(
        avatarId: avatarId,
        email: email,
        name: name,
        password: password,
        confirmPassword: confirmPassword,
        phone: phone);
    var result = await registerUseCase.call(request: requestModel);
    result.fold((error) {
      emit(
        RegisterFailedState(failures: error.toString()),
      );
    }, (model) {
      emit(
        RegisterSuccessState(authModel: model),
      );
    });
  }

  void login() async {
    emit(LoginLoadingState());
    var result = await loginUseCase.call(loginEmail, loginPassword);
    result.fold((error) {
      emit(
        LoginFailedState(failures: error.toString()),
      );
    }, (model) {
      CacheHelper.saveToken(model.data!);
      emit(
        LoginSuccessState(loginModel: model),
      );
    });
  }
}
