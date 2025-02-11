import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/user_model.dart';

import '../../models/login_response.dart';

abstract class AuthRepo{
  Future<RegisterResponse> register(UserModel userModel);
  Future<LoginResponse> login(String email,String password);
}