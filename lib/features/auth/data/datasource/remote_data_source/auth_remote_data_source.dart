import 'package:movies_app/features/auth/data/models/auth_model.dart';
import 'package:movies_app/features/auth/data/models/register_request_model.dart';

import '../../models/login_model.dart';

abstract class AuthRemoteDataSource{
Future<AuthModel> register({RegisterRequestModel? request});
Future<LoginModel> login(String email,String password);
}