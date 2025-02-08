import 'package:movies_app/models/register_response.dart';
import 'package:movies_app/models/user_model.dart';

abstract class AuthRepo{
  Future<RegisterResponse> register(UserModel userModel);
}